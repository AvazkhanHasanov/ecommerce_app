import 'package:ecommerce_app/features/product_detail/widgets/star_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsWithStar extends StatelessWidget {
  const StatsWithStar({
    super.key,
    required this.oneStars,
    required this.twoStars,
    required this.threeStars,
    required this.fourStars,
    required this.fiveStars,
    required this.totalStars,
  });

  final int oneStars;
  final int twoStars;
  final int threeStars;
  final int fourStars;
  final int fiveStars;
  final int totalStars;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        ...List.generate(
          5,
          (index) {
            Map<int, int> ratingMap = {
              5: fiveStars,
              4: fourStars,
              3: threeStars,
              2: twoStars,
              1: oneStars,
            };
            final rating = 5 - index;
            final foiz = ratingMap[rating];
            final percentage = foiz != null && totalStars != 0 ? foiz / totalStars : 0.0;
            return Row(
              spacing: 12.w,
              children: [
                StarRow(rating: rating, spacing: 6, s: 16),
                Flexible(
                  fit: FlexFit.loose,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(12),
                    value: percentage,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.black,
                    minHeight: 8,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
