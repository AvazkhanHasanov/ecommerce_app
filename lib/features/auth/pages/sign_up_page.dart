import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_top_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_rich_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_text_form_field.dart';
import 'package:ecommerce_app/features/auth/widgets/once_rich_text.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_up_divider.dart';
import 'package:ecommerce_app/features/onboarding/pages/text_button_with_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hasErrorName = false;
  bool hasErrorEmail = false;
  bool accountButton = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              spacing: 12.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthTopText(text: 'Create an account', subtext: 'Let’s create your account.'),

                SizedBox(height: 4.h),

                AuthTextFormField(
                  hasError: hasErrorName,
                  hintText: 'Enter your full name',
                  label: 'Full Name',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      hasErrorName = true;
                      return 'Please Full nameni to`liq yozing';
                    } else {
                      hasErrorName = false;
                      accountButton = true;

                      return null;
                    }
                  },
                ),
                AuthTextFormField(
                  hasError: hasErrorEmail,
                  hintText: 'Enter your email address',
                  label: 'Email',
                  controller: emailController,
                  validator: (value) {
                    final emailRegExp = RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (value == null || value.isEmpty) {
                      hasErrorEmail = true;
                      return 'Please enter valid email address';
                    } else if (!emailRegExp.hasMatch(value)) {
                      hasErrorEmail = true;
                      return 'Email farmati noto`g`ri';
                    }
                    hasErrorEmail = false;
                    accountButton = true;

                    return null;
                  },
                ),
                AuthTextFormField(
                  isPassword: true,
                  hintText: 'Enter your password',
                  label: 'Password',
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please password kiriting ';
                    }
                    return null;
                  },
                ),

                const AuthRichText(),

                AppTextFormField(
                  text: 'Create an Account',
                  onPressed: () {},
                  textColor: AppColors.primary0,
                  backgroundColor: accountButton ? AppColors.primary900 : AppColors.primary200,
                ),
                SizedBox(height: 5.h),
                const AuthUpDivider(),
                SizedBox(height: 5.h),
                TextButtonWithRow(
                  backgroundColor: AppColors.primary0,
                  borderColor: AppColors.primary200,
                  children: [
                    SvgPicture.asset(AppIcons.google),
                    Text(
                      'Sign Up with Google',
                      style: AppStyle.b1Medium.copyWith(
                        color: AppColors.primary900,
                      ),
                    ),
                  ],
                  onPressed: () {},
                ),
                TextButtonWithRow(
                  backgroundColor: AppColors.blue,
                  borderColor: AppColors.primary200,
                  children: [
                    SvgPicture.asset(AppIcons.facebook),
                    Text(
                      'Sign Up with Facebook',
                      style: AppStyle.b1Medium.copyWith(
                        color: AppColors.primary0,
                      ),
                    ),
                  ],
                  onPressed: () {},
                ),
                OnceRichText(
                  text: 'Already have an account? ',
                  subtext: 'Log In',
                  onTap: () => context.go(Routes.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
