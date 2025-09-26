import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/account/widgets/account_row.dart';
import 'package:ecommerce_app/features/account/widgets/for_log_out.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final secure = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Account'),
      body: Padding(
        padding:  EdgeInsets.only(top: 20.h),
        child: Column(
          spacing: 10.h,
          children: [
            AccountRow(icon: AppIcons.box, text: 'My Orders', needDivider: false),
            Divider(thickness: 8, color: AppColors.primary100),
            AccountRow(icon: AppIcons.details, text: 'My Details'),
            AccountRow(icon: AppIcons.address, text: 'Address Book'),
            AccountRow(icon: AppIcons.cart, text: 'Payment Methods'),
            AccountRow(icon: AppIcons.bell, text: 'Notifications', needDivider: false),
            Divider(thickness: 8, color: AppColors.primary100),
            AccountRow(icon: AppIcons.question, text: 'FAQs'),
            AccountRow(icon: AppIcons.headPhones, text: 'Help Center', needDivider: false),
            Divider(thickness: 8, color: AppColors.primary100),
            AccountRow(
              icon: AppIcons.logout,
              text: 'Logout',
              color: AppColors.red,
              needIcon: false,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      backgroundColor: AppColors.primary0,
                      content: forLogOut(secure: secure),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
