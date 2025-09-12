import 'package:ecommerce_app/features/auth/widgets/login_rich_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_text_form_field.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_top_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_up_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/app_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool accountButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTopText(
                text: 'Login to your account',
                subtext: 'It’s great to see you again.',
              ),
              SizedBox(height: 14.h),
              Form(
                child: Column(
                  spacing: 14.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthTextFormField(
                      hintText: 'Enter your email address',
                      label: 'Email',
                      controller: emailController,
                    ),
                    AuthTextFormField(
                      hintText: 'Enter your password',
                      label: 'Password',
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              const LoginRichText(),
              AppTextFormField(
                text: 'Create an Account',
                onPressed: () {},
                borderColor: AppColors.primary200,
                textColor: AppColors.primary0,
                backgroundColor: accountButton ? AppColors.primary900 : AppColors.primary200,
              ),
              AuthUpDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
