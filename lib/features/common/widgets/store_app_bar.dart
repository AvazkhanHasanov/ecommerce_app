import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({
    super.key,
    this.needAction = true,
    this.centerTitle = true,
  });

  final bool needAction;
  final bool centerTitle;

  @override
  Size get preferredSize => Size(double.infinity, 120.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppIconButton(
        icon: AppIcons.backArrow,
        onPressed: () => context.pop(),
      ),
      title: Text('Notification'),
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
    );
  }
}
