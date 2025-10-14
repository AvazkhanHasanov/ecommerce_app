import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ForNoCard extends StatelessWidget {
  const ForNoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: BoxBorder.all(color: AppColors.primary100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'carta qo`shing --->',
              style: AppStyle.b1Medium.copyWith(color: AppColors.primary500),
            ),
            SizedBox(width: 14),
            IconButton(onPressed: () => context.push(Routes.payment), icon: SvgPicture.asset(AppIcons.edit)),
          ],
        ),
      ),
    );
  }
}
