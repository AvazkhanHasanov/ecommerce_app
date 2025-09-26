import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextAndPrice extends StatelessWidget {
  const TextAndPrice({
    super.key,
    required this.text,
    required this.price,
  });

  final String text;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
        ),
        Text('\$ $price', style: AppStyle.b1Medium),
      ],
    );
  }
}
