import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/order/widgets/review_bottom_sheet.dart';
import 'package:flutter/material.dart';

class PriceTrack extends StatelessWidget {
  const PriceTrack({
    super.key,
    required this.price,
    required this.productId,
  });

  final int productId;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$ $price', style: AppStyle.b2SemiBold),
        AppTextButton(
          fontSize: 10,
          backgroundColor: AppColors.primary900,
          borderColor: AppColors.primary900,
          textColor: AppColors.primary0,
          text: 'Track Order',
          onPressed: () {
            showReviewBottomSheet(context, productId: productId);
          },
          width: 90,
          height: 30,
        ),
      ],
    );
  }
}
