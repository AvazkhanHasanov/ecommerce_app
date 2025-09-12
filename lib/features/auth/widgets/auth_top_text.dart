import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTopText extends StatelessWidget {
  const AuthTopText({
    super.key,
    required this.text,
    required this.subtext,
  });

  final String text, subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppStyle.h2),
        Text(
          subtext,
          style: AppStyle.b1Regular.copyWith(
            color: AppColors.primary500,
            height: 0.5,
          ),
        ),
      ],
    );
  }
}
