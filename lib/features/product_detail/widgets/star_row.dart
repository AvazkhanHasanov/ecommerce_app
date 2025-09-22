import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRow extends StatelessWidget {
  const StarRow({
    super.key,
    required this.rating,
    this.spacing = 9,
    this.s = 24,
  });

  final num rating;
  final double spacing;
  final double s;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing.w,
      children: [
        ...List.generate(
          rating.toInt(),
          (index) => SvgPicture.asset(
            AppIcons.star,
            width: s.r,
            height: s.r,
            colorFilter: ColorFilter.mode(
              AppColors.gold,
              BlendMode.srcIn,
            ),
          ),
        ),
        ...List.generate(
          5 - rating.toInt(),
          (index) => SvgPicture.asset(
            AppIcons.star,
            width: s.r,
            height: s.r,
          ),
        ),
      ],
    );
  }
}
