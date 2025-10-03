import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatContainer extends StatelessWidget {
  const CatContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  });

  final String text;
  final Color textColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: borderColor),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: AppStyle.b1Medium.copyWith(color: textColor),
        ),
      ),
    );
  }
}
