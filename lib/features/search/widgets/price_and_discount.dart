import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceAndDiscount extends StatelessWidget {
  const PriceAndDiscount({
    required this.discount,
    required this.price,
    super.key,
  });

  final int price;
  final num discount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\$ $price',
        style: AppStyle.b3Medium.copyWith(color: AppColors.primary500),
        children: discount != 0
            ? [
                TextSpan(
                  text: ' -$discount%',
                  style: AppStyle.b3Medium.copyWith(color: AppColors.red),
                ),
              ]
            : [],
      ),
    );
  }
}
