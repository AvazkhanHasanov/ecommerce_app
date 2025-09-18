import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTextButton extends StatelessWidget {
  const CategoryTextButton({
    super.key,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    required this.border,
    this.height = 36,
    this.horizontal = 20,
    this.onPressed,
    this.radius = 10,
  });

  final String title;
  final Color textColor, backgroundColor, border;
  final VoidCallback? onPressed;
  final double height;
  final double horizontal, radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: horizontal.w),
          backgroundColor: backgroundColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: border),
          ),
        ),
        child: Text(
          title,
          style: AppStyle.b1Medium.copyWith(color: textColor),
        ),
      ),
    );
  }
}
