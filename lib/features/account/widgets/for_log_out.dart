import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';

class forLogOut extends StatelessWidget {
  const forLogOut({
    super.key,
    required this.secure,
  });

  final FlutterSecureStorage secure;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 341.w,
      height: 336.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        spacing: 12.h,
        children: [
          SvgPicture.asset(AppIcons.warningCircleBig),
          Text('Logout?', style: AppStyle.h4SemiBold),
          Text(
            'Are you sure you want to logout?',
            style: AppStyle.b1Regular.copyWith(
              color: AppColors.primary500,
              letterSpacing: 0.2,
            ),
          ),
          AppTextButton(
            text: 'Yes, Logout',
            onPressed: () async {
              await secure.deleteAll();
              if (!context.mounted) return;
              context.go(Routes.login);
            },
            backgroundColor: AppColors.red,
            textColor: AppColors.primary0,
            borderColor: Colors.transparent,
          ),
          AppTextButton(
            text: 'No, Cancel',
            onPressed: () => context.pop(),
            backgroundColor: AppColors.primary0,
            borderColor: AppColors.primary200,
          ),
        ],
      ),
    );
  }
}
