import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/data/models/reviews_model.dart';
import 'package:ecommerce_app/features/product_detail/widgets/star_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllReviews extends StatelessWidget {
  const AllReviews({required this.reviews, super.key});

  final List<ReviewsModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          reviews.length,
          (index) => Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarRow(rating: reviews[index].rating, spacing: 6, s: 16),
              Text(reviews[index].comment, style: AppStyle.b2Regular.copyWith(color: AppColors.primary500)),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: reviews[index].userFullName,
                      style: AppStyle.b3SemiBold,
                      children: [
                        TextSpan(
                          text: ' • ${reviews[index].createdString}',
                          style: AppStyle.b3Regular.copyWith(color: AppColors.primary500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (index != reviews.length - 1) const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
