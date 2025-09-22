import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({
    required this.reviewsCount,
    required this.rating,
    super.key,
  });

  final num rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: [
        SvgPicture.asset(
          AppIcons.star,
          colorFilter: ColorFilter.mode(AppColors.gold, BlendMode.srcIn),
        ),
        RichText(
          text: TextSpan(
            text: '${rating.toStringAsFixed(1)}/5',
            style: AppStyle.b1Medium.copyWith(decoration: TextDecoration.underline),
            children: [
              TextSpan(
                text: ' ($reviewsCount reviews)',
                style: AppStyle.b1Medium.copyWith(color: AppColors.primary500, decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
