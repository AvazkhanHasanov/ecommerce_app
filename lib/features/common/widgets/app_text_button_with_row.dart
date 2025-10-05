import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButtonWithRow extends StatelessWidget {
  const AppTextButtonWithRow({
    super.key,
    this.height = 54,
    this.width = 341,
    this.isLoading = false,
    required this.onPressed,
    required this.children,
    this.borderColor = AppColors.primary900,
    this.backgroundColor = AppColors.primary900,
  });

  final double width;
  final double height;
  final bool isLoading;
  final List<Widget> children;
  final VoidCallback? onPressed;
  final Color backgroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          disabledBackgroundColor: AppColors.primary500,

          backgroundColor: backgroundColor,
          side: BorderSide(color: onPressed != null ? borderColor : AppColors.primary500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator()
            : Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
      ),
    );
  }
}
