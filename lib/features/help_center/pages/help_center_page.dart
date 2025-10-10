import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/help_center/pages/services_container.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Help Center'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          spacing: 14.h,
          children: [
            ServicesContainer(icon: AppIcons.headPhones, text: 'Customer Service',onTap: () => context.push(Routes.chat)),
            ServicesContainer(icon: AppIcons.whatsapp, text: 'Whatsapp'),
            ServicesContainer(icon: AppIcons.web, text: 'Website'),
            ServicesContainer(icon: AppIcons.facebook, text: 'Facebook'),
            ServicesContainer(icon: AppIcons.twitter, text: 'Twitter'),
            ServicesContainer(icon: AppIcons.instagram, text: 'Instagram'),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
