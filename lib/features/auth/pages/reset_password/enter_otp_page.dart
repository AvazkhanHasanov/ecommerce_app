import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/features/auth/widgets/once_rich_text.dart';
import 'package:ecommerce_app/features/auth/widgets/otp_text_form_field.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/reset_top_text.dart';

class EnterOtpPage extends StatefulWidget {
  const EnterOtpPage({super.key});

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {
  bool isActive = false;
  static const otpLength = 4;
  final _formKey = GlobalKey<FormState>();
  final controller = List.generate(otpLength, (index) => TextEditingController());
  final focusNode = List.generate(otpLength, (index) => FocusNode());

  void _validateForm() {

    final allController = controller.every((element) => element.text.isNotEmpty);
    setState(() {
      isActive =  allController;
    });
  }

  @override
  void initState() {
    controller.forEach((element) => element.addListener(_validateForm));
    super.initState();
  }

  @override
  void dispose() {
    for (var element in focusNode) {
      element.dispose();
    }
    for (var element in controller) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          spacing: 16.h,
          children: [
            ResetTopText(
              text: 'Enter 4 Digit Code',
              subtext: 'Enter 4 digit code that your receive on your email (cody.fisher45@example.com).',
            ),

            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.w,
                children: [
                  ...List.generate(
                    4,
                    (index) => OtpTextFormField(
                      validator: (value) =>Validators.otp(value),
                      focusNode: focusNode[index],
                      controller: controller[index],
                      onChanged: (value) {
                        if (value.length == 1 && index < otpLength - 1) {
                          focusNode[index + 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            OnceRichText(text: 'Email not received? ', subtext: "Resend code"),
            Spacer(),
            AppTextButton(
              textColor: AppColors.primary0,
              text: 'Continue',
              onPressed: isActive ? () {} : null,
              backgroundColor: isActive ? AppColors.primary900 : AppColors.primary200,
            ),
            SizedBox(height: 15.h)
          ],
        ),
      ),
    );
  }
}
