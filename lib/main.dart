import 'package:ecommerce_app/core/routing/router.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/dependencies.dart';
import 'core/hive_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: dependencies,
      child: ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme,
          themeMode: ThemeMode.light,
          routerConfig: router,
        ),
      ),
    );
  }
}
