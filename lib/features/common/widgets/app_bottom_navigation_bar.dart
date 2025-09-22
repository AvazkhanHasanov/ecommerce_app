import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int selectedIndex = 0;

  void _tapped(int index) {
    setState(() => selectedIndex = index);

    switch (index) {
      case 0:
        context.go(Routes.homePage);
        break;
      case 1:
        context.go(Routes.search);
        break;
      case 2:
        context.go(Routes.saved);
        break;
      case 3:
        context.go(Routes.cart);
        break;
      case 4:
        context.go(Routes.account);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: AppColors.primary0,
      selectedIndex: selectedIndex,
      onDestinationSelected: _tapped,
      labelPadding: EdgeInsets.zero,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppStyle.b3Medium;
          } else {
            return AppStyle.b3Medium.copyWith(color: AppColors.primary400);
          }
        },
      ),
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.home,
            colorFilter: ColorFilter.mode(
              selectedIndex == 0 ? AppColors.primary900 : AppColors.primary400,
              BlendMode.srcIn,
            ),
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.search,
            colorFilter: ColorFilter.mode(
              selectedIndex == 1 ? AppColors.primary900 : AppColors.primary400,
              BlendMode.srcIn,
            ),
          ),
          label: 'Search',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.heart,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2 ? AppColors.primary900 : AppColors.primary400,
              BlendMode.srcIn,
            ),
          ),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.cart,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3 ? AppColors.primary900 : AppColors.primary400,
              BlendMode.srcIn,
            ),
          ),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.user,
            colorFilter: ColorFilter.mode(
              selectedIndex == 4 ? AppColors.primary900 : AppColors.primary400,
              BlendMode.srcIn,
            ),
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
