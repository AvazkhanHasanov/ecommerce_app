import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({super.key, required this.text, required this.icon, this.onTap});

  final String text;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: BoxBorder.all(color: AppColors.primary100, width: 1),
        ),
        child: Row(
          spacing: 12.w,
          children: [
            SvgPicture.asset(icon),
            Text(text, style: AppStyle.b1Medium),
          ],
        ),
      ),
    );
  }
}
