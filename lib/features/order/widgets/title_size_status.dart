import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleSizeStatus extends StatelessWidget {
  const TitleSizeStatus({
    super.key,
    required this.title,
    required this.size,
    required this.status,
  });

  final String title;
  final String size;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.b2SemiBold),
            Text('Size $size', style: AppStyle.b3Regular.copyWith(color: AppColors.primary500)),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 24.h,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
          decoration: BoxDecoration(color: AppColors.primary100, borderRadius: BorderRadius.circular(6.r)),
          child: Text(status, style: AppStyle.b3Medium.copyWith(fontSize: 10.sp)),
        ),
      ],
    );
  }
}
