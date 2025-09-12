import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AuthUpDivider extends StatelessWidget {
  const AuthUpDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.primary100)),
        Text(
          'Or',
          style: AppStyle.b2Regular.copyWith(color: AppColors.primary500),
        ),
        Expanded(child: Divider(color: AppColors.primary100)),
      ],
    );
  }
}
