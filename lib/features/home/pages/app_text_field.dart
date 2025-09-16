import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorHeight: 25,
      cursorColor: AppColors.primary400,
      // style: AppStyle.b1Medium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        hintStyle: AppStyle.b1Regular.copyWith(color: AppColors.primary400),
        hintText: 'Search for clothes...',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primary100),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primary100),
        ),
        suffixIconConstraints: BoxConstraints.tight(Size(24.w, 24.h)),
        prefixIconConstraints: BoxConstraints.tight(Size(24.w, 24.h)),
        suffixIcon: SvgPicture.asset(AppIcons.mic, width: 24.w, height: 24.h),
        prefixIcon: SvgPicture.asset(AppIcons.search, width: 24.w, height: 24.h),
      ),
    );
  }
}
