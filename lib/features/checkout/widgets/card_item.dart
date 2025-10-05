import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.index,
    required this.isActive,
    required this.onPressed,
  });

  final int index;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppTextButtonWithRow(
      height: 36,
      onPressed: onPressed,
      backgroundColor: isActive ? AppColors.primary900 : Colors.transparent,
      borderColor: isActive ? AppColors.primary100 : AppColors.primary900,
      width: 109.w,
      children: [
        SvgPicture.asset(
          [AppIcons.cardDuotone, AppIcons.cash][index],
          colorFilter: ColorFilter.mode(isActive ? AppColors.primary0 : AppColors.primary900, BlendMode.srcIn),
        ),
        Text(
          ["Card", "Cash"][index],
          style: AppStyle.b2Medium.copyWith(color: isActive ? AppColors.primary0 : AppColors.primary900),
        ),
      ],
    );
  }
}
