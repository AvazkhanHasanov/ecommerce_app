import 'package:ecommerce_app/core/routing/router.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/dependencies.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder:(context, child) =>  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().lightTheme,
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
