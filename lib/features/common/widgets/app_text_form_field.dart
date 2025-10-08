import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.icon = AppIcons.question,
    required this.controller,
    required this.hintText,
    this.needLabel = true,
    this.needIcon = false,
    this.readOnly = false,
    this.inputFormatter,
    required this.label,
    this.keyboardType,
    this.width = 341,
    this.validator,
    this.onChanged,
    this.prefix,
    this.onTap,
    super.key,
  });

  final String icon;
  final String label;
  final double width;
  final bool readOnly;
  final bool needIcon;
  final bool needLabel;
  final Widget? prefix;
  final String hintText;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        needLabel ? Text(label, style: AppStyle.b1Medium) : SizedBox.shrink(),
        SizedBox(
          width: width.w,
          child: TextFormField(
            onTap: onTap,
            readOnly: readOnly,
            onChanged: onChanged,
            validator: validator,
            cursorColor: AppColors.primary900,
            keyboardType: keyboardType,
            controller: controller,
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              prefix: prefix,
              prefixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
              suffixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
              suffixIcon: needIcon
                  ? Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: SvgPicture.asset(icon, width: 24.r, height: 24.r),
                    )
                  : SizedBox.shrink(),
              hintStyle: AppStyle.b1Regular.copyWith(color: AppColors.primary400),
              hintText: hintText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: AppColors.primary100,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: AppColors.primary100,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: AppColors.primary100,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
