import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    super.key,
  });

  @override
  Widget build(BuildContext _context) {
    return RichText(
      text: TextSpan(
        text: 'By signing up you agree to our',
        style: AppStyle.b2Regular,
        children: [
          WidgetSpan(child: SizedBox(width: 2.w)),
          TextSpan(
            text: 'Terms,',
            style: AppStyle.b2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          WidgetSpan(child: SizedBox(width: 2.w)),

          TextSpan(
            text: 'Privacy Policy',
            style: AppStyle.b2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: ' and ', style: AppStyle.b2Regular),
          TextSpan(
            text: 'Cookie Use',
            style: AppStyle.b2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
