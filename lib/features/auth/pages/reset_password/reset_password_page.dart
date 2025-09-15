import 'package:ecommerce_app/data/models/auth_model/reset_password_model.dart';
import 'package:ecommerce_app/features/auth/pages/reset_password/auth_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../common/widgets/app_text_button.dart';
import '../../managers/reset_password_view_model.dart';
import '../../widgets/auth_text_form_field.dart';
import '../../widgets/reset_top_text.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isActive = false;

  void _validateForm() {
    final password = passwordController.text.trim();
    final confirm = confirmController.text.trim();
    final isValid =
        password.isNotEmpty &&
        confirm.isNotEmpty &&
        Validators.password(password) == null &&
        Validators.confirmPassword(confirm, passwordController) == null;
    setState(() {
      isActive = isValid;
    });
  }

  @override
  void initState() {
    passwordController.addListener(_validateForm);
    confirmController.addListener(_validateForm);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Consumer<ResetPasswordViewModel>(
          builder: (context, vm, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResetTopText(
                text: 'Reset Password',
                subtext:
                    'Set the new password for your account so you can login and access all the features.',
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  spacing: 16.h,
                  children: [
                    AuthTextFormField(
                      isPassword: true,
                      validator: (value) => Validators.password(value),
                      hintText: 'Enter new password',
                      label: 'Password',
                      controller: passwordController,
                    ),
                    AuthTextFormField(
                      isPassword: true,
                      validator: (value) =>
                          Validators.confirmPassword(value, passwordController),
                      hintText: 'Confirm your new password',
                      label: 'Confirm Password',
                      controller: confirmController,
                    ),
                  ],
                ),
              ),
              Spacer(),

              AppTextButton(
                onPressed: isActive
                    ? () async {
                        final email = vm.email!;
                        final code = vm.code!;
                        final model = ResetModel(
                          email: email,
                          code: code,
                          password: passwordController.text,
                        );
                        final result = await vm.resent(resetData: model);
                        if (result) {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AuthShowDialog();
                            },
                          );
                        }
                      }
                    : null,
                text: 'Continue',
                isLoading: vm.isSentToEmailLoading,
                textColor: AppColors.primary0,
                backgroundColor: isActive
                    ? AppColors.primary900
                    : AppColors.primary200,
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
