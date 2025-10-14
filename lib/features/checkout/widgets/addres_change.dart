import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressChange extends StatelessWidget {
  const AddressChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Delivery Address', style: AppStyle.b1SemiBold),
        GestureDetector(
          onTap: () => context.push(Routes.address),
          child: Text(
            'Change',
            style: AppStyle.b2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
