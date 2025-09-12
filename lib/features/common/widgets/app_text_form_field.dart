import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.backgroundColor = AppColors.primary200,
    required this.text,
    this.textColor = AppColors.primary900,
    required this.onPressed,
    this.borderColor = AppColors.primary900,
  });

  final Color backgroundColor;
  final String text;
  final Color textColor, borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 341.w,
      height: 54,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(text, style: AppStyle.b1Medium.copyWith(color: textColor)),
      ),
    );

  }
}
