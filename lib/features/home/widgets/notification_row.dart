import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({
    super.key, required this.title, required this.content, required this.icon,
  });

  final String title;
  final String content;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13.w,
      children: [
        SvgPicture.asset(icon),
        Column(
          spacing: 2.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.b2SemiBold),
            Text(
              content,
              style: AppStyle.b3Regular.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
