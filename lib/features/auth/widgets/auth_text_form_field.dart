import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/auth/widgets/auth_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.hasError = false,
    required this.controller,
  });

  final bool hasError;
  final bool isPassword;
  final String hintText, label;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppStyle.b1Medium),
        TextFormField(

          obscureText: isSelected,
          obscuringCharacter: '*',
          controller: widget.controller,
          validator: widget.validator,
          style: AppStyle.b1Medium,
          keyboardType: widget.isPassword?TextInputType.number:TextInputType.name,
          textInputAction: TextInputAction.next,
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

            suffixIconConstraints: BoxConstraints(minHeight: 24.h, minWidth: 24.w),
            suffixIcon: widget.isPassword
                ? AuthIconButton(
                    onPressed: () {
                      isSelected = !isSelected;
                      setState(() {});
                    },
                    padding: EdgeInsets.only(right: 20.w),
                    icon: isSelected ? AppIcons.eye : AppIcons.eyeOff,
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: SvgPicture.asset(widget.hasError ? AppIcons.warningCircle : AppIcons.correct),
                  ),
            hintStyle: AppStyle.b1Regular.copyWith(color: AppColors.primary400),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
