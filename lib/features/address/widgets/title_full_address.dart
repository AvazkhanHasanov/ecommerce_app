import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleFullAddress extends StatelessWidget {
  const TitleFullAddress({
    super.key,
    required this.title,
    required this.fullAddress,
    required this.addressId,
    required this.groupRegistry,
  });

  final String title;

  final String fullAddress;
  final int addressId;
  final RadioGroupRegistry<int>? groupRegistry;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        SvgPicture.asset(AppIcons.location),
        Expanded(
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyle.b2SemiBold),
              Text(
                fullAddress,
                style: AppStyle.b2Regular.copyWith(color: AppColors.primary500, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        Radio<int>(
          fillColor: WidgetStateColor.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primary900;
              }
              return AppColors.primary500;
            },
          ),
          value: addressId,
          groupRegistry: groupRegistry,
        ),
      ],
    );
  }
}
