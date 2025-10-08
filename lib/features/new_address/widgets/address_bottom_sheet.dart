import 'package:ecommerce_app/data/models/address_create_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/new_address/manager/new_address_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import '../../common/widgets/app_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/context_extensions.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({
    super.key,
    required this.fullAddress,
    required this.lat,
    required this.lng,
  });

  final String? fullAddress;
  final double lat, lng;

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final addressController = TextEditingController();
  late final fullAddressController = TextEditingController(text: widget.fullAddress ?? 'Address yuklanmoqda...');
  bool isDefault = false;

  bool get isEnable => addressController.text.trim().isNotEmpty && fullAddressController.text.trim().isNotEmpty;

  @override
  void initState() {
    addressController.addListener(onChanged);
    fullAddressController.addListener(onChanged);
    super.initState();
  }

  void onChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 64.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Address', style: AppStyle.h4SemiBold),
              IconButton(onPressed: () => context.pop(), icon: SvgPicture.asset(AppIcons.cancel)),
            ],
          ),
          Divider(color: AppColors.primary100),
          AppTextFormField(
            controller: addressController,
            hintText: 'enter nickname',
            label: 'Address Nickname',
          ),
          AppTextFormField(
            controller: fullAddressController,
            hintText: 'Enter your full Address...',
            label: 'Full Address',
          ),
          CheckboxListTile(
            title: Text(
              'Make this as a default address',
              style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
            ),
            value: isDefault,
            onChanged: (value) => setState(() => isDefault = value!),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.primary900,
            contentPadding: EdgeInsets.zero,
          ),
          AppTextButton(
            isLoading: context.read<NewAddressBloc>().state.newAddressStatus == Status.loading,
            text: 'Add',
            onPressed: isEnable
                ? () {
                    final data = AddressCreateModel(
                      title: addressController.text,
                      fullAddress: fullAddressController.text,
                      lat: widget.lat,
                      lng: widget.lng,
                      isDefault: isDefault,
                    );
                    context.read<NewAddressBloc>().add(CreateAddress(data: data));

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        backgroundColor: AppColors.primary0,
                        content: Container(
                          width: 341.w,
                          constraints: BoxConstraints(minHeight:270.h ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10.h,
                            children: [
                              SvgPicture.asset(AppIcons.checkDuotone),
                              Text(
                                'Congratulations!',
                                style: AppStyle.h4SemiBold,
                              ),
                              Text(
                                'Your new address has been added.',
                                style: AppStyle.b1Regular,textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 14.h),
                              AppTextButton(
                                text: 'Thanks',
                                onPressed: () => context.go(Routes.address),
                                backgroundColor: AppColors.primary900,
                                textColor: AppColors.primary0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                : null,
            backgroundColor: isEnable ? AppColors.primary900 : AppColors.primary200,
            borderColor: isEnable ? AppColors.primary900 : AppColors.primary200,
            textColor: AppColors.primary0,
          ),
          20.height,
        ],
      ),
    );
  }
}
