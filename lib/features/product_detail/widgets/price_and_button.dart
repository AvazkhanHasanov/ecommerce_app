import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceAndButton extends StatelessWidget {
  const PriceAndButton({
    required this.price,
    super.key,
  });
final int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
            ),
            Text('\$ $price', style: AppStyle.h3),
          ],
        ),
        AppTextButtonWithRow(
          onPressed: () {},
          width: 240.w,
          children: [
            SvgPicture.asset(AppIcons.bag),
            Text(
              'Add to Cart',
              style: AppStyle.b1Medium.copyWith(color: AppColors.primary0),
            ),
          ],
        ),
      ],
    );
  }
}
