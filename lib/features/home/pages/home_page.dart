import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:ecommerce_app/features/home/managers/home_cubit.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/home/widgets/category_container.dart';
import 'package:ecommerce_app/features/home/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final category = ['All', ...state.category.map((x) => x.title)];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 56.h,
                  floating: true,
                  pinned: true,
                  title: Text('Discover', style: AppStyle.h2),
                  actions: [
                    AppIconButton(
                      icon: AppIcons.bell,
                      size: Size(24.r, 24.r),
                      onPressed: () => context.push(Routes.notification),
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  delegate: _ItemsDelegate(
                    state: state,
                    controller: controller,
                  ),
                  pinned: false,
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        category.length,
                        (index) {
                          final title = category[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: CategoryTextButton(
                              title: title,
                              textColor: selectedIndex == index ? AppColors.primary0 : AppColors.primary900,
                              backgroundColor: selectedIndex == index ? AppColors.primary900 : AppColors.primary0,
                              border: selectedIndex == index ? AppColors.primary900 : AppColors.primary100,
                              onPressed: () {
                                if (title != 'All') {
                                  final categoryId = state.category[index - 1].id;
                                  context.read<HomeCubit>().fetchProducts(
                                    queryParams: {'CategoryId': categoryId},
                                  );
                                  setState(() {});
                                } else {
                                  context.read<HomeCubit>().fetchProducts();
                                }
                                setState(() {});
                                selectedIndex = index;
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 161 / 224,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.product.length,
                    (context, index) => Center(
                      child: Product(
                        likePressed: () => context.read<HomeCubit>().toggleLike(state.product[index].id),
                        isLiked: state.product[index].isLiked,
                        discount: state.product[index].discount,
                        image: state.product[index].image,
                        text: state.product[index].title,
                        price: state.product[index].price,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}

class _ItemsDelegate extends SliverPersistentHeaderDelegate {
  final HomeState state;
  final TextEditingController controller;

  _ItemsDelegate({required this.state, required this.controller});

  @override
  double get minExtent => 0; // scroll qilganda yo‘qoladi
  @override
  double get maxExtent => 60.h;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final opacity = shrinkOffset > 0 ? 0.0 : 1.0;

    return Opacity(
      opacity: opacity,
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: AppTextField(controller: controller),
              ),

              AppIconButton(
                icon: AppIcons.filter,
                onPressed: () {},
                backgroundColor: AppColors.primary900,
                foregroundColor: AppColors.primary0,
                size: Size(52.r, 52.r),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
