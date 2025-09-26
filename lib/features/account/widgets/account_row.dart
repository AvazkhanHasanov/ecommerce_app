import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.needIcon = true,
    this.color = AppColors.primary900,
    this.needDivider = true,
  });

  final String icon;
  final String text;
  final VoidCallback? onTap;
  final bool needIcon;
  final Color color;
  final bool needDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        spacing: 20.h,
        children: [
          GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Row(
              spacing: 16.w,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    color,
                    BlendMode.srcIn,
                  ),
                ),
                Text(text, style: AppStyle.b1Regular.copyWith(color: color)),
                Spacer(),
                needIcon
                    ? SvgPicture.asset(
                        AppIcons.chevron,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary500,
                          BlendMode.srcIn,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          needDivider ? Divider(color: AppColors.primary100) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
