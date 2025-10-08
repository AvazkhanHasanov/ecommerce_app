import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/features/address/widgets/title_full_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    this.onTap,
    required this.title,
    required this.fullAddress,
    required this.groupRegistry,
    required this.addressId,
  });

  final VoidCallback? onTap;
  final String title;
  final String fullAddress;
  final RadioGroupRegistry<int>? groupRegistry;
  final int addressId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 76.h,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: BoxBorder.all(color: AppColors.primary100),
        ),
        child: TitleFullAddress(
          addressId: addressId,
          groupRegistry: groupRegistry,
          title: title,
          fullAddress: fullAddress,
        ),
      ),
    );
  }
}
