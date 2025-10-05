import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    this.height = 54,
    this.fontSize = 16,
    this.width = 341,
    required this.text,
    this.borderWidth = 1,
    this.isLoading = false,
    required this.onPressed,
    this.textColor = AppColors.primary900,
    this.borderColor = AppColors.primary900,
    this.backgroundColor = AppColors.primary200,
    super.key,
  });

  final String text;
  final double width;
  final double height;
  final bool isLoading;
  final double fontSize;
  final double borderWidth;
  final Color backgroundColor;
  final void Function()? onPressed;
  final Color textColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(color: AppColors.primary500),
              )
            : Text(
                text,
                style: AppStyle.b1Medium.copyWith(color: textColor, fontSize: fontSize.sp),
              ),
      ),
    );
  }
}
