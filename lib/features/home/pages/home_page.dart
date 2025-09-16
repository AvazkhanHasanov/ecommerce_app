import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:ecommerce_app/features/home/pages/app_text_field.dart';
import 'package:ecommerce_app/features/home/pages/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final controller = TextEditingController();

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> myList = [
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
    {
      'image': AppIcons.imagePng,
      'text': 'Regular Fit Polo',
      'price': 1234,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 55.h,
              floating: true,
              // pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsetsDirectional.only(start: 20, bottom: 16),
                centerTitle: false,
                title: Text('Discover', style: AppStyle.h2),
              ),
              actions: [SvgPicture.asset(AppIcons.bell)],
            ),
            SliverToBoxAdapter(
              child: Row(
                spacing: 8.w,
                children: [
                  Expanded(child: AppTextField(controller: controller)),
                  AppIconButton(
                    icon: AppIcons.filter,
                    onPressed: () {},
                    backgroundColor: AppColors.primary900,
                    foregroundColor: AppColors.primary0,
                    size: Size(52.r, 52.r),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 161 / 224,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: myList.length,
                (context, index) => Center(
                  child: Product(
                    image: myList[index]['image'],
                    text: myList[index]['text'],
                    price: myList[index]['price'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
