import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/data/models/auth_model/login_model.dart';
import 'package:ecommerce_app/features/auth/managers/login_view_model.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_text_form_field.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_top_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_up_divider.dart';
import 'package:ecommerce_app/features/auth/widgets/login_rich_text.dart';
import 'package:ecommerce_app/features/auth/widgets/once_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/app_text_button.dart';
import '../../common/widgets/app_text_button_with_row.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hasErrorEmail = true;
  bool isActive = false;

  final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      isActive = isValid && emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
      hasErrorEmail = !(emailController.text.isNotEmpty && emailRegExp.hasMatch(emailController.text));
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (context) => LoginViewModel(authRepo: context.read()),
        builder: (context, child) => SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
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
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    spacing: 14.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthTextFormField(
                        hasError: hasErrorEmail,
                        hintText: 'Enter your email address',
                        label: 'Email',
                        controller: emailController,
                        validator: (value) => Validators.email(value),
                      ),
                      AuthTextFormField(
                        isPassword: true,
                        hintText: 'Enter your password',
                        label: 'Password',
                        controller: passwordController,
                        validator: (value) => Validators.password(value),
                      ),
                    ],
                  ),
                ),
                LoginRichText(),
                AppTextButton(
                  text: 'Login',
                  onPressed: isActive
                      ? () async {
                          if (_formKey.currentState!.validate()) {
                            final viewModel = context.read<LoginViewModel>();
                            LoginModel loginData = LoginModel(
                              login: emailController.text,
                              password: passwordController.text,
                            );

                            final result = await viewModel.login(loginData: loginData);
                            if (result) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Muvaffaqiyatli')));
                              // context.go(context.home);
                            }
                          }
                        }
                      : null,
                  isLoading: context.read<LoginViewModel>().isLoginLoading,
                  borderColor: AppColors.primary200,
                  textColor: AppColors.primary0,
                  backgroundColor: isActive ? AppColors.primary900 : AppColors.primary200,
                ),
                AuthUpDivider(),
                AppTextButtonWithRow(
                  backgroundColor: AppColors.primary0,
                  borderColor: AppColors.primary200,
                  children: [
                    SvgPicture.asset(AppIcons.google),
                    Text(
                      'Login with Google',
                      style: AppStyle.b1Medium.copyWith(
                        color: AppColors.primary900,
                      ),
                    ),
                  ],
                  onPressed: () {},
                ),
                AppTextButtonWithRow(
                  backgroundColor: AppColors.blue,
                  borderColor: AppColors.primary200,
                  children: [
                    SvgPicture.asset(AppIcons.facebook),
                    Text(
                      'Login with Facebook',
                      style: AppStyle.b1Medium.copyWith(
                        color: AppColors.primary0,
                      ),
                    ),
                  ],
                  onPressed: () {},
                ),
                Spacer(),
                OnceRichText(
                  text: 'Don\'t have an account? ',
                  subtext: 'Join',
                  onTap: () => context.go(Routes.signUpPage),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
