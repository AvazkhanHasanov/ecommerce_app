import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextFormField extends StatelessWidget {
  const OtpTextFormField({
    super.key,
    required this.focusNode,
    this.validator,
    required this.controller,
    required this.onChanged,
  });

  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.w,
      height: 60.h,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        cursorHeight: 25.h,
        cursorColor: AppColors.primary900,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(color: AppColors.primary100),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(color: AppColors.primary100),
          ),
        ),
      ),
    );
  }
}
