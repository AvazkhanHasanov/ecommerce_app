import 'package:ecommerce_app/features/cart/widgets/text_and_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtotalAndFee extends StatelessWidget {
  const SubtotalAndFee({
    super.key,
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
  });

  final int subTotal;
  final int vat;
  final int shippingFee;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        TextAndPrice(text: 'Sub-total', price: subTotal),
        TextAndPrice(text: 'VAT (%)', price: vat),
        TextAndPrice(text: 'Shipping fee', price: shippingFee),
      ],
    );
  }
}
