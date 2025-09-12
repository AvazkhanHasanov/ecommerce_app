import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnceRichText extends StatelessWidget {
  const OnceRichText({
    super.key,
    required this.text,
    required this.subtext,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String text, subtext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style: AppStyle.b1Regular,
          children: [
            TextSpan(
              text: subtext,
              style: AppStyle.b1Medium.copyWith(
                decoration: TextDecoration.underline,
                height: 1.4,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
