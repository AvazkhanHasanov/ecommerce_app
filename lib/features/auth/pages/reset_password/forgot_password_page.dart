import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/features/auth/widgets/reset_top_text.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_text_form_field.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  static final _emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool hasErrorEmail = true;
  bool isActive = false;

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      isActive = isValid;
      hasErrorEmail = !(emailController.text.isNotEmpty && _emailRegExp.hasMatch(emailController.text));
    });
  }

  @override
  void initState() {
    emailController.addListener(_validateForm);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResetTopText(
              text: 'Forgot password',
              subtext: 'Enter your email for the verification process. We will send 4 digits code to your email.',
            ),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: AuthTextFormField(
                hasError: hasErrorEmail,
                validator: (value) => Validators.email(value),
                hintText: 'Enter your email address',
                label: 'Email',
                controller: emailController,
              ),
            ),
            Spacer(),
            AppTextButton(
              text: 'Send Code',
              onPressed: isActive
                  ? () {
                      context.push(Routes.enterPage);
                    }
                  : null,
              textColor: AppColors.primary0,
              backgroundColor: isActive ? AppColors.primary900 : AppColors.primary200,
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
