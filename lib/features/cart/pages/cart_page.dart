import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/cart/managers/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/managers/cart_state.dart';
import 'package:ecommerce_app/features/cart/widgets/subtotal_and_fee.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_container.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:ecommerce_app/features/common/widgets/for_no_item.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'MyCart', needDivider: false),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartStatus == Status.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.cartStatus == Status.error && state.errorCart != null) {
            return Center(child: Text('Xatolik yuz berdi: ${state.errorCart}'));
          }

          if (state.cartStatus == Status.success && (state.myCartItems == null || state.myCartItems!.items.isEmpty)) {
            return ForNoItem(
              icon: AppIcons.cart,
              text: 'Your Cart Is Empty!',
              subtext: 'When you add products, they’ll appear here.',
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<CartBloc>().add(GetMyCartItems());
                Future.delayed(Duration(milliseconds: 500));
              },
              child: SingleChildScrollView(
                child: Column(
                  spacing: 14.h,
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.myCartItems!.items.length,
                      itemBuilder: (context, index) {
                        if (state.myCartItems == null || state.myCartItems!.items.isEmpty) {
                          return Center(child: Text('Savat bo‘sh'));
                        }
                        final items = state.myCartItems!.items[index];
                        return CartContainer(
                          id: items.id,
                          price: items.price,
                          count: items.quantity,
                          title: items.title,
                          size: items.size,
                          image: items.image,
                        );
                      },
                    ),
                    SubtotalAndFee(
                      total: state.myCartItems!.total,
                      subTotal: state.myCartItems!.subTotal,
                      vat: state.myCartItems!.vat,
                      shippingFee: state.myCartItems!.shippingFee,
                    ),
                    SizedBox(height: 50),
                    AppTextButtonWithRow(
                      onPressed: state.myCartItems != null
                          ? () {
                              context.push(Routes.checkout);
                            }
                          : null,
                      children: [
                        Text('Go To Checkout', style: AppStyle.b1Medium.copyWith(color: AppColors.primary0)),
                        SvgPicture.asset(AppIcons.arrowRight),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
