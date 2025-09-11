import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 844.h,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5, top: 100),
              child: Image.asset(AppIcons.element2Png),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 40.h),
              child: Text('Define yourself in your unique way.', style: AppStyle.h1.copyWith(height: 0.8)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.scale(
                scale: 1.3,
                child: Transform.translate(
                  offset: Offset(90, 155),
                  child: Image.asset(
                    AppIcons.broPng,
                    width: 358.w,
                    height: 687.h,
                    fit: BoxFit.cover,
                    color: Colors.grey.withAlpha((255 / 12).toInt()),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.scale(
                scale: 1.3,
                child: Transform.translate(
                  offset: Offset(30, 135),
                  child: Image.asset(
                    AppIcons.broPng,
                    width: 358.w,
                    height: 687.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 107.h,
        color: AppColors.primary0,
        child: SizedBox(
          width: 341.w,
          height: 54,
          child: TextButton(
            onPressed: () {
              context.go(Routes.signUpPage);
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            child: Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: AppStyle.b1Medium.copyWith(color: AppColors.primary0),
                ),
                SvgPicture.asset(AppIcons.arrowRight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
