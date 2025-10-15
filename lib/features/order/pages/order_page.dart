import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/for_no_item.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/order/managers/order_cubit.dart';
import 'package:ecommerce_app/features/order/managers/order_state.dart';
import 'package:ecommerce_app/features/order/widgets/orders_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/icons.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    // _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'My Orders'),
      body: BlocProvider(
        create: (context) => OrderCubit(orderRepo: context.read(), reviewsRepo: context.read()),

        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state.ordersStatus == Status.loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300, // or AppColors.primary50
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _controller,
                      labelColor: AppColors.primary900,
                      unselectedLabelColor: AppColors.primary400,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelStyle: AppStyle.b2Medium,

                      splashFactory: NoSplash.splashFactory,
                      unselectedLabelStyle: AppStyle.b2Medium.copyWith(
                        color: AppColors.primary400,
                      ),
                      tabs: [
                        Tab(child: Text('Ongoing')),
                        Tab(child: Text('Completed')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: TabBarView(
                          controller: _controller,
                          children: [
                            state.orders.isEmpty
                                ? ForNoItem(
                                    text: 'No Ongoing Orders',
                                    icon: AppIcons.boxDuotone,
                                    subtext: 'you don\'t have any ongoing orders at this time',
                                  )
                                : ListView.separated(
                                    separatorBuilder: (context, index) => SizedBox(height: 14.h),
                                    itemCount: state.orders.length,
                                    itemBuilder: (context, index) {
                                      final order = state.orders[index];
                                      return OrdersContainer(
                                        rating: order.rating,
                                        productId: order.id,
                                        title: order.title,
                                        size: order.size,
                                        status: order.status,
                                        image: order.image,
                                        price: order.price,
                                        isLoading: state.ordersStatus == Status.loading,
                                      );
                                    },
                                  ),

                            state.orders.isEmpty
                                ? ForNoItem(
                                    text: 'No Completed Orders',
                                    icon: AppIcons.boxDuotone,
                                    subtext: 'you don\'t have any completed orders at this time',
                                  )
                                : ListView.separated(
                                    separatorBuilder: (context, index) => SizedBox(height: 14.h),
                                    itemCount: state.orders.length,
                                    itemBuilder: (context, index) => OrdersContainer(
                                      productId: state.orders[index].id,
                                      title: 'Regular Fit Slogan',
                                      size: 'X',
                                      status: 'Picked',
                                      image: state.orders[index].image,
                                      price: 1222,
                                      isLoading: state.ordersStatus == Status.loading,
                                      rating: state.orders[index].rating,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
