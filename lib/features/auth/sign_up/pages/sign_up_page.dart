import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create an account', style: AppStyle.h2),
              Text(
                'Let’s create your account.',
                style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name', style: AppStyle.b1Medium),
                  TextFormField(
                    validator: (value) {
                      final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid email address';
                      } else if (!emailRegExp.hasMatch(value)) {
                        return 'Email farmati noto`g`ri';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.always,
                    style: AppStyle.b1Medium,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.primary100, width: 1.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.green, width: 1.w),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.red, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.green, width: 1.w),
                      ),
                      hintStyle: AppStyle.b1Regular.copyWith(color: AppColors.primary400),
                      hintText: 'Enter your full name',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
