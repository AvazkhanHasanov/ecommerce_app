import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hintText, required this.controller, this.onChanged});

  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      cursorHeight: 25,
      cursorColor: AppColors.primary400,
      // style: AppStyle.b1Medium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        hintStyle: AppStyle.b1Regular.copyWith(color: AppColors.primary400),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primary100),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primary100),
        ),
        suffixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
        prefixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),

        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: SvgPicture.asset(AppIcons.mic, width: 24.w, height: 24.h),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SvgPicture.asset(AppIcons.search, width: 24.w, height: 24.h),
        ),
      ),
    );
  }
}
