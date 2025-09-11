import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary0,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppStyle.h3,
    ),
  );
}
