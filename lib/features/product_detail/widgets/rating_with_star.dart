import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/product_detail/widgets/star_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWithStar extends StatelessWidget {
  const RatingWithStar({
    required this.reviewsCount,
    required this.rating,
    super.key,
  });

  final num rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18.w,
      children: [
        Text(rating.toStringAsFixed(1), style: AppStyle.h1),
        Column(
          spacing:6.h ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StarRow(rating: rating),
            Text(
              '$reviewsCount Ratings',
              style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
            ),
          ],
        ),
      ],
    );
  }
}
