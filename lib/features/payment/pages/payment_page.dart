import 'package:ecommerce_app/core/context_extensions.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:ecommerce_app/features/common/widgets/for_no_item.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/payment/managers/payment_bloc.dart';
import 'package:ecommerce_app/features/payment/managers/payment_state.dart';
import 'package:ecommerce_app/features/payment/widgets/for_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/styles.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int? selectedCardId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Payment Method'),
      body: BlocProvider(
        create: (context) => PaymentBloc(cardRepo: context.read())..add(GetCards()),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state.statusCards == Status.loading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state.cards.isNotEmpty) {
              selectedCardId ??= state.cards[0].id;
            } else {
              selectedCardId = 0;
            }
            double baseHeight = MediaQuery.of(context).size.height / 1.9;
            double reducedHeight = baseHeight - ((state.cards.length) * 52.h);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 500));
                  context.read<PaymentBloc>().add(GetCards());
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      state.cards.isEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
                              child: ForNoItem(
                                text: 'no Cards',
                                icon: AppIcons.cardDuotone,
                                subtext: 'Press the “Add New Card” button to add a card',
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Saved Cards', style: AppStyle.b1SemiBold),
                                14.height,
                                RadioGroup<int>(
                                  groupValue: selectedCardId,
                                  onChanged: (value) => setState(() {
                                    selectedCardId = value;
                                  }),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) => SizedBox(height: 12.h),
                                    itemCount: state.cards.length,
                                    itemBuilder: (context, index) => ForCard(
                                      cardId: state.cards[index].id,
                                      groupRegistry: RadioGroup.maybeOf<int>(context),
                                      code: state.cards[index].cardNumber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      24.height,
                      AppTextButtonWithRow(
                        backgroundColor: AppColors.primary0,
                        children: [
                          SvgPicture.asset(AppIcons.plus, width: 24, height: 24),
                          Text('Add New Card', style: AppStyle.b1Medium),
                        ],
                        onPressed: () {
                          context.push(Routes.newCard);
                        },
                      ),
                      state.cards.length <= 10 ? reducedHeight.height : 40.height,
                      state.cards.isNotEmpty
                          ? AppTextButton(
                              text: 'Apply',
                              onPressed: () {},
                              backgroundColor: AppColors.primary900,
                              textColor: AppColors.primary0,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
