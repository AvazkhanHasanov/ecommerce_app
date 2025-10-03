import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class HeartIcon extends StatelessWidget {
  const HeartIcon({
    super.key,
     this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color foregroundColor, backgroundColor;
  final VoidCallback? onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34.w,
      height: 34.h,
      child: Tooltip(
        textStyle: AppStyle.b1Medium,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.primary0),
        message: 'like',
        showDuration: Duration(seconds: 1),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shadowColor: AppColors.primary100,
            splashFactory: NoSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            fixedSize: Size(34.r, 34.r),
            padding: EdgeInsets.zero,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
