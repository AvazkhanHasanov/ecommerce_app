import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    this.padding = EdgeInsets.zero,
    this.size = const Size(10, 10),
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.primary0,
    this.foregroundColor = AppColors.primary900,
    this.radius = 10,
    super.key,
  });

  final String icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Size size;
  final EdgeInsets padding;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tight(
        size,
      ),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
        backgroundColor: backgroundColor,
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
      ),
    );
  }
}
