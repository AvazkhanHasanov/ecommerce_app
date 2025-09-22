import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class AppTextButtonWithPadding extends StatelessWidget {
  const AppTextButtonWithPadding({
    this.backgroundColor = AppColors.primary200,
    this.borderColor = AppColors.primary900,
    this.textColor = AppColors.primary900,
    required this.onPressed,
    this.isLoading = false,
    this.borderWidth = 1,
    required this.text,
    this.height = 47,
    super.key,
  });

  final Color textColor, borderColor;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double borderWidth;
  final bool isLoading;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
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
