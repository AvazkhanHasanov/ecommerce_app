import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<bool> isRegistered() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token != null && token.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    isRegistered().then((value) async {
      await Future.delayed(Duration(seconds: 4));
      if (value) {
        context.go(Routes.homePage);
      } else {
        context.go(Routes.onboardingPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
