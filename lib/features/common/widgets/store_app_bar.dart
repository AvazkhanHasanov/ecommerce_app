import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({
    this.height = 75,
    required this.title,
    this.needAction = true,
    this.centerTitle = true,
    this.needDivider = true,
    super.key,
  });

  final String title;
  final double height;
  final bool needAction;
  final bool needDivider;
  final bool centerTitle;

  @override
  Size get preferredSize => Size(double.infinity, height.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          AppBar(
            leadingWidth: 24,
            leading: AppIconButton(
              icon: AppIcons.backArrow,
              onPressed: () => context.pop(),
            ),
            title: Text(title),
            centerTitle: centerTitle,
            actionsPadding: EdgeInsets.only(right: 24.w),
            actions: [
              needAction
                  ? AppIconButton(
                      icon: AppIcons.bell,
                      size: Size(24.r, 24.r),
                      onPressed: () => context.push(Routes.notification),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          needDivider ? Divider(color: AppColors.primary100) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
