import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    super.key,
    required this.price,
    required this.count,
  });

  final int price;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('\$$price'),

        Row(
          spacing: 9.w,
          children: [
            AppIconButton(
              radius: 3.r,
              borderColor: AppColors.primary200,
              size: Size(24.r, 24.r),
              icon: AppIcons.minus,
              onPressed: () {},
            ),
            Text('$count'),
            AppIconButton(
              radius: 3.r,
              borderColor: AppColors.primary200,
              size: Size(24.r, 24.r),
              icon: AppIcons.plus,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
