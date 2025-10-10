import 'dart:math';
import 'package:ecommerce_app/features/new_address/manager/new_address_bloc.dart';
import 'package:ecommerce_app/features/new_address/manager/new_address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/utils/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/new_address/widgets/get_address.dart';
import 'package:ecommerce_app/features/new_address/widgets/address_bottom_sheet.dart';

class NewAddressPage extends StatefulWidget {
  const NewAddressPage({super.key});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> with TickerProviderStateMixin {
  final addressController = TextEditingController();
  final fullAddressController = TextEditingController();
  late final AnimationController transformationController;
  final mapController = MapController();
  bool isDefault = false;
  bool isLoading = false;

  Future<void> _animateToPoint(LatLng dest, double destZoom) async {
    final startCenter = mapController.camera.center;
    final startZoom = mapController.camera.zoom;

    final latTween = Tween<double>(
      begin: startCenter.latitude,
      end: dest.latitude,
    );
    final lngTween = Tween<double>(
      begin: startCenter.longitude,
      end: dest.longitude,
    );
    final zoomTween = Tween<double>(begin: startZoom, end: destZoom);

    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    controller.addListener(() {
      final lat = latTween.evaluate(animation);
      final lng = lngTween.evaluate(animation);
      final zoom = zoomTween.evaluate(animation);
      mapController.move(LatLng(lat, lng), zoom);
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  Future _initLocation() async {
    await Geolocator.requestPermission();
  }

  LatLng? selectedPoint;
  String? locationName;
  String? string;

  @override
  void initState() {
    super.initState();
    transformationController = AnimationController(vsync: this, duration: Duration(seconds: 1));

    _initLocation();
  }

  @override
  void dispose() {
    addressController.dispose();
    fullAddressController.dispose();
    // transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'NewAppBar'),
      body: BlocBuilder<NewAddressBloc, NewAddressState>(
        builder: (context, state) => Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: LatLng(41.285902, 69.203651),
                      onTap: (tapPosition, point) async {
                        setState(() => selectedPoint = point);
                        await _animateToPoint(point, 15);
                        mapController.move(point, mapController.camera.zoom);
                        final placemarks = await getPlaceName(
                          latitude: point.latitude,
                          longitude: point.longitude,
                        );
                        if (placemarks.isNotEmpty) {
                          final place = placemarks.first;
                          setState(() {
                            locationName = [
                              place.name,
                              place.locality,
                              place.administrativeArea,
                              place.country,
                            ].where((e) => e != null && e!.isNotEmpty).join(', ');
                          });
                        }
                        showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          context: context,

                          transitionAnimationController: transformationController,
                          isScrollControlled: true,
                          backgroundColor: AppColors.primary0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          builder: (context) {
                            return AddressBottomSheet(
                              lat: selectedPoint!.latitude,
                              lng: selectedPoint!.longitude,
                              fullAddress: locationName,
                            );
                          },
                        );
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      ),
                      if (selectedPoint != null)
                        MarkerLayer(
                          markers: [Marker(point: selectedPoint!, child: SvgPicture.asset(AppIcons.location))],
                        ),
                    ],
                  ),

                  Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary900,
                      splashColor: Colors.transparent,
                      onPressed: () async {
                        setState(() => isLoading = true);
                        try {
                          LocationPermission permission = await Geolocator.checkPermission();
                          if (permission == LocationPermission.denied) {
                            permission = await Geolocator.requestPermission();
                            if (permission == LocationPermission.denied) {
                              throw Exception('Permission denied');
                            }
                          }
                          if (permission == LocationPermission.deniedForever) {
                            await Geolocator.openAppSettings();
                            return;
                          }
                          if (!await Geolocator.isLocationServiceEnabled()) {
                            await Geolocator.openLocationSettings();
                          }

                          final selectedPoint = await Geolocator.getCurrentPosition();

                          mapController.move(
                            LatLng(selectedPoint.latitude, selectedPoint.longitude),
                            min(mapController.camera.zoom + 5, 18.0),
                          );
                          final placemarks = await getPlaceName(
                            latitude: selectedPoint.latitude,
                            longitude: selectedPoint.longitude,
                          );
                          if (placemarks.isNotEmpty) {
                            final place = placemarks.first;
                            setState(() {
                              locationName = [
                                place.name,
                                place.locality,
                                place.administrativeArea,
                                place.country,
                              ].where((e) => e != null && e!.isNotEmpty).join(', ');
                            });
                            debugPrint('Siz hozir: $locationName');
                          }
                        } catch (e) {
                          await _initLocation();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Error: ${e.toString()}',
                              ),
                            ),
                          );
                        } finally {
                          setState(() => isLoading = false);
                        }
                      },
                      child: isLoading
                          ? CircularProgressIndicator(color: AppColors.primary0)
                          : Icon(Icons.my_location, color: AppColors.primary0),
                    ),
                  ),
                  Text('$locationName'),
                ],
              ),
            ),

            // AppTextButton(
            //   text: 'location',
            //   onPressed: () {
            //     showModalBottomSheet(
            //       barrierColor: Colors.transparent,
            //       context: context,
            //       isScrollControlled: true,
            //       backgroundColor: AppColors.primary0,
            //       shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            //       ),
            //       builder: (context) {
            //         return Container();
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
