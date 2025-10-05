import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/cart/managers/cart_bloc.dart';
import 'package:ecommerce_app/features/checkout/widgets/with_card.dart';
import 'package:ecommerce_app/features/checkout/widgets/addres_change.dart';
import 'package:ecommerce_app/features/checkout/widgets/card_item.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../cart/widgets/subtotal_and_fee.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedIndex = 0;
  final promoController = TextEditingController();

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final price = context.select((CartBloc bloc) => bloc.state.myCartItems);
    return Scaffold(
      appBar: StoreAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddresChange(),
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(AppIcons.location),
                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('title', style: AppStyle.b2SemiBold),
                      Text(
                        'fullAddress',
                        style: AppStyle.b2Regular.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: AppColors.primary100),
              Text('Payment Method', style: AppStyle.b1SemiBold),
              Row(
                spacing: 8.w,
                children: List.generate(
                  2,
                  (index) => PaymentMethod(
                    index: index,
                    isActive: index == selectedIndex,
                    onPressed: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                  ),
                ),
              ),

              WithCard(),
              Divider(color: AppColors.primary100),
              Text('Order Summary', style: AppStyle.b1SemiBold),
              SubtotalAndFee(
                subTotal: price!.subTotal,
                vat: price.vat,
                shippingFee: price.shippingFee,
                total: price.total,
              ),
              SizedBox(height: 6.h),

              Row(
                spacing: 8.w,
                children: [
                  AppTextField(
                    width: 249,
                    hintText: 'Enter promo code',
                    controller: promoController,
                    prefix: AppIcons.disCount,
                    needSuffix: false,
                  ),
                  AppTextButton(
                    height: 52,
                    width: 84.w,
                    onPressed: () {},
                    text: 'Add',
                    backgroundColor: AppColors.primary900,
                    textColor: AppColors.primary0,
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              AppTextButton(
                text: 'Place Order',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      backgroundColor: AppColors.primary0,
                      content: Container(
                        width: 341.w,
                        height: 270.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                        child: Column(
                          spacing: 10.h,
                          children: [
                            SvgPicture.asset(AppIcons.checkDuotone),
                            Text('Congratulations!', style: AppStyle.h4SemiBold),
                            Text('Your order has been placed.', style: AppStyle.b1Regular),
                            SizedBox(height: 14.h),
                            AppTextButton(
                              text: 'Track Your Order',
                              onPressed: () => context.go(Routes.homePage),
                              backgroundColor: AppColors.primary900,
                              textColor: AppColors.primary0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                backgroundColor: AppColors.primary900,
                textColor: AppColors.primary0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
