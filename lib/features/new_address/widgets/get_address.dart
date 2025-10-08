import 'package:geocoding/geocoding.dart';

Future<List> getPlaceName({required double latitude, required double longitude}) async {
  List<Placemark> placemark = await placemarkFromCoordinates(latitude, longitude,);
  await GeocodingPlatform.instance!.setLocaleIdentifier('uz_UZ');
  return placemark;
}
