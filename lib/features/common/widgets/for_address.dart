import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForAddress extends StatelessWidget {
  const ForAddress({
    super.key,
    required this.title,
    required this.fullAddress,
  });

  final String title;
  final String fullAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        SvgPicture.asset(AppIcons.location),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.b2SemiBold),
            Text(
              fullAddress,
              style: AppStyle.b2Regular.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
