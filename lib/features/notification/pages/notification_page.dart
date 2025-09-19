import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/notification/widgets/notification_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(needAction: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Text(
                  'Today',
                  style: AppStyle.b1SemiBold,
                ),
                NotificationRow(
                  title: '30% Special Discount!',
                  content: 'Special promotion only valid today.',
                  icon: AppIcons.details,
                ),
                Divider(color: AppColors.primary100),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Text(
                  'Yesterday',
                  style: AppStyle.b1SemiBold,
                ),
                NotificationRow(
                  title: 'Top Up E-wallet Successfully!',
                  content: 'You have top up your e-wallet.',
                  icon: AppIcons.edit,
                ),
                Divider(color: AppColors.primary100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
