import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
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

  final bool isLoading;
  final Color backgroundColor;
  final String text;
  final Color textColor, borderColor;
  final void Function()? onPressed;
  final double width;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 54,
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
            : Text(text, style: AppStyle.b1Medium.copyWith(color: textColor)),
      ),
    );
  }
}
