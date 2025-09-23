import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForNoItem extends StatelessWidget {
  const ForNoItem({
    super.key,
    required this.icon,
    required this.text,
    required this.subtext,
  });

  final String icon, text, subtext;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 160.h,
          width: 272.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  AppColors.primary400,
                  BlendMode.srcIn,
                ),
              ),
              Text(text, style: AppStyle.h4SemiBold),
              Text(
                subtext,
                style: AppStyle.b1Regular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
  }
}
