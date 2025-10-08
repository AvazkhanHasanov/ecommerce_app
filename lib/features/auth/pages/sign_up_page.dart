import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/data/models/auth_model/sign_up_model.dart';
import 'package:ecommerce_app/features/auth/managers/sign_up_view_model.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_top_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_rich_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_text_form_field.dart';
import 'package:ecommerce_app/features/auth/widgets/once_rich_text.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_up_divider.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  final passwordRegExp = RegExp(r'^[0-9]+$');
  bool hasErrorName = true;
  bool hasErrorEmail = true;
  bool isActive = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      isActive =
          isValid &&
          nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
      hasErrorName = nameController.text.isEmpty;
      hasErrorEmail = !(emailController.text.isNotEmpty && emailRegExp.hasMatch(emailController.text));
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (context) => SignUpViewModel(authRepo: context.read()),
        builder: (context, child) => SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
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
                      validator: (value) => Validators.name(value),
                    ),
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
                    const AuthRichText(),
                    AppTextButton(
                      isLoading: context.read<SignUpViewModel>().isSignLoading,
                      text: 'Create an Account',
                      onPressed: isActive
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                final viewModel = context.read<SignUpViewModel>();
                                SignUpModel data = SignUpModel(
                                  fullName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                final result = await viewModel.signUp(signData: data);
                                if (result) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Muvaffaqiyatli')));
                                  context.go(Routes.login);
                                }
                              }
                            }
                          : null,
                      textColor: AppColors.primary0,
                      backgroundColor: isActive ? AppColors.primary900 : AppColors.primary200,
                    ),
                    SizedBox(height: 5.h),
                    const AuthUpDivider(),
                    SizedBox(height: 5.h),
                    AppTextButtonWithRow(
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
                    AppTextButtonWithRow(
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
        ),
      ),
    );
  }
}
