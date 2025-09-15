import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';

class AuthShowDialog extends StatelessWidget {
  const AuthShowDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(
          20.r,
        ),
      ),
      backgroundColor: AppColors.primary0,
      child: SizedBox(
        width: 341.w,
        height: 292.h,

        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.h,
            children: [
              SvgPicture.asset(AppIcons.correct, width: 78.r, height: 78.r),
              Text(
                'Password Changed!',
                style: AppStyle.h4SemiBold,
                textAlign: TextAlign.center,
              ),
              Text(
                'Your can now use your new password to login to your account.',
                style: AppStyle.b1Regular.copyWith(color: AppColors.primary500, letterSpacing: -1),
              ),

              AppTextButton(
                textColor: AppColors.primary0,
                backgroundColor: AppColors.primary900,
                width: 293.w,
                text: 'Login',
                onPressed: () {
                  context.go(Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
