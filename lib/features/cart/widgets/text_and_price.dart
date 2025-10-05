import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextAndPrice extends StatelessWidget {
  const TextAndPrice({
    super.key,
    required this.text,
    required this.price,
    this.isTotal=false,
  });

  final String text;
  final int price;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyle.b1Regular.copyWith(color:isTotal?AppColors.primary900: AppColors.primary500),
        ),
        Text('\$ $price', style: AppStyle.b1Medium),
      ],
    );
  }
}
