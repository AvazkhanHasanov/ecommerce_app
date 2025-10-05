import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/features/cart/widgets/text_and_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtotalAndFee extends StatelessWidget {
  const SubtotalAndFee({
    super.key,
    required this.vat,
    required this.total,
    required this.subTotal,
    required this.shippingFee,
  });

  final int vat;
  final int total;
  final int subTotal;
  final int shippingFee;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        TextAndPrice(text: 'Sub-total', price: subTotal),
        TextAndPrice(text: 'VAT (%)', price: vat),
        TextAndPrice(text: 'Shipping fee', price: shippingFee),
        Divider(color: AppColors.primary100),
        TextAndPrice(text: 'Total', price: total,isTotal: true),
      ],
    );
  }
}
