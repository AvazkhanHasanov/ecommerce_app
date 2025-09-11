import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      context.go(Routes.onboardingPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 800.h,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(top: 13, child: Image.asset(AppIcons.elementPng)),
                  Positioned(
                    top: 400.h,
                    child: SvgPicture.asset(AppIcons.logo),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
