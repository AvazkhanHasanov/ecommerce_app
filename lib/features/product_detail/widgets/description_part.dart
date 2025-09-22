import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/product_detail/widgets/rating_and_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({
    super.key,
    required this.title,
    required this.reviewsCount,
    required this.rating,
    required this.description,
  });

  final String title;
  final int reviewsCount;
  final num rating;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 13.h,
      children: [
        Text(title, style: AppStyle.h3),
        RatingAndReviews(reviewsCount: reviewsCount, rating: rating),
        Text(
          description,
          style: AppStyle.b1Regular.copyWith(color: AppColors.primary500, letterSpacing: 0.2),
        ),
      ],
    );
  }
}
