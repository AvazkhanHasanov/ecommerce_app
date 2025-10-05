import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.onChanged,
    this.width = 341,
    this.needSuffix = true,
    this.needPrefix = true,
    required this.hintText,
    required this.controller,
    this.suffix = AppIcons.mic,
    this.prefix = AppIcons.search,
  });

  final String suffix;
  final String prefix;
  final double width;
  final String hintText;
  final bool needPrefix;
  final bool needSuffix;
  final void Function(String)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextField(
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.primary500),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.primary100),
          ),
          suffixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
          prefixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
          suffixIcon: needSuffix
              ? Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: SvgPicture.asset(suffix, width: 24.w, height: 24.h),
                )
              : SizedBox.shrink(),
          prefixIcon: needPrefix
              ? Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 10.w),
                  child: SvgPicture.asset(prefix, width: 24.w, height: 24.h),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
