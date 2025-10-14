import 'package:ecommerce_app/data/models/order_model/orders_create_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/widgets/subtotal_and_fee.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/context_extensions.dart';
import 'package:ecommerce_app/features/cart/managers/cart_bloc.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/checkout/widgets/card_item.dart';
import 'package:ecommerce_app/features/checkout/widgets/with_card.dart';
import 'package:ecommerce_app/features/common/widgets/for_address.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/checkout/widgets/for_no_card.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/common/widgets/app_functions.dart';
import 'package:ecommerce_app/features/checkout/widgets/addres_change.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/checkout/managers/checkout_bloc.dart';
import 'package:ecommerce_app/features/checkout/managers/checkout_state.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, this.cartId});

  final int? cartId;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedIndex = 0;
  final promoController = TextEditingController();
  int? selectedCartId;

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    debugPrint('🟦 initState widget.cartId: ${widget.cartId}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedCartId = widget.cartId;
      });
      debugPrint('✅ selectedCartId set to: $selectedCartId');
    });
  }

  void updateCart(int newCartId) {
    setState(() {
      selectedCartId = newCartId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final price = context.select((CartBloc bloc) => bloc.state.myCartItems);
    return Scaffold(
      appBar: StoreAppBar(title: 'Checkout'),
      body: BlocProvider(
        create: (context) =>
            CheckoutBloc(orderRepo: context.read(), addressRepo: context.read(), cardRepo: context.read())
              ..add(FetchCards())
              ..add(FetchAddress()),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state.addressStatus == Status.loading || state.addressList!.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.cardStatus == Status.loading || state.cardList!.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddressChange(),
                    ForAddress(
                      title: state.addressList!.first.nickname,
                      fullAddress: state.addressList!.first.fullAddress,
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

                    if (state.cardList == null || state.cardList!.isEmpty)
                      ForNoCard()
                    else
                      WithCard(
                        cardNumber: getCardNumberById(state.cardList, selectedCartId),
                      ),

                    Divider(color: AppColors.primary100),
                    Text('Order Summary', style: AppStyle.b1SemiBold),
                    SubtotalAndFee(
                      subTotal: price!.subTotal,
                      vat: price.vat,
                      shippingFee: price.shippingFee,
                      total: price.total,
                    ),
                    6.height,

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
                    BlocConsumer<CheckoutBloc, CheckoutState>(
                      listener: (context, state) {
                        if (state.orderStatus == Status.success) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              backgroundColor: AppColors.primary0,
                              content: Container(
                                width: 341.w,
                                height: 270.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  spacing: 10.h,
                                  children: [
                                    SvgPicture.asset(AppIcons.checkDuotone),
                                    Text(
                                      'Congratulations!',
                                      style: AppStyle.h4SemiBold,
                                    ),
                                    Text(
                                      'Your order has been placed.',
                                      style: AppStyle.b1Regular,
                                    ),
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
                        } else if (state.orderStatus == Status.error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('failure')));
                        }
                      },
                      builder: (context, state) => AppTextButton(
                        isLoading: state.orderStatus == Status.loading,
                        text: 'Place Order',
                        onPressed: state.addressList!.isNotEmpty && state.cardList!.isNotEmpty
                            ? () async {
                                final data = OrdersCreateModel(
                                  addressId: state.addressList!.first.id,
                                  paymentMethod: 'Card',
                                  cardId: selectedCartId ?? state.cardList!.first.id,
                                );
                                context.read<CheckoutBloc>().add(CreateOrder(data: data));
                              }
                            : null,
                        backgroundColor: AppColors.primary900,
                        textColor: AppColors.primary0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
