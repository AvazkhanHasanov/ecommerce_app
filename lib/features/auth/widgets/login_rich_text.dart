import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginRichText extends StatelessWidget {
  const LoginRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Forgot your password? ',
        style: AppStyle.b2Regular,
        children: [
          TextSpan(
            text: 'Reset your password',
            style: AppStyle.b2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(Routes.forgotPassword);
              },
          ),
        ],
      ),
    );
  }
}
