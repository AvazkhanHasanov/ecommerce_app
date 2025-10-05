import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/data/models/card/cards_create_model.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/new_card/managers/new_card_bloc.dart';
import 'package:ecommerce_app/features/new_card/managers/new_card_state.dart';
import 'package:ecommerce_app/features/new_card/widgets/card_number_formatter.dart';
import 'package:ecommerce_app/features/new_card/widgets/expiry_date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/app_text_button.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final cardController = TextEditingController();
  final dateController = TextEditingController();
  final cvcController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'NewCard'),
      body: BlocProvider(
        create: (context) => NewCartBloc(cardRepo: context.read()),
        child: BlocBuilder<NewCartBloc, NewCardState>(
          builder: (context, state) => Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h, top: 10.h),
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Debit or Credit Card', style: AppStyle.b1SemiBold),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    spacing: 16.h,
                    children: [
                      AppTextFormField(
                        label: 'Card number',
                        hintText: 'Enter your card number',
                        keyboardType: TextInputType.number,
                        controller: cardController,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                          LengthLimitingTextInputFormatter(19),
                        ],
                        validator: Validators.validateCardNumber,
                        onChanged: (_) => setState(() => isActive = _formKey.currentState!.validate()),
                      ),
                      Row(
                        spacing: 12.w,
                        children: [
                          AppTextFormField(
                            width: 165,
                            controller: dateController,
                            label: 'Expiry Date',
                            hintText: 'MM/YY',
                            keyboardType: TextInputType.number,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              ExpiryDateFormatter(),
                            ],
                            validator: Validators.validateExpiryDate,
                            onChanged: (_) => setState(() => isActive = _formKey.currentState!.validate()),
                          ),
                          AppTextFormField(
                            width: 165,
                            label: 'Security Code',
                            hintText: 'CVC',
                            needIcon: true,
                            keyboardType: TextInputType.number,
                            controller: cvcController,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            validator: Validators.validateCVV,
                            onChanged: (_) => setState(() => isActive = _formKey.currentState!.validate()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                AppTextButton(
                  text: 'Add Card',
                  onPressed: isActive
                      ? () {
                          final data = CardsCreateModel(
                            cardNumber: cardController.text.replaceAll(' ', ''),
                            expiryDate: formatDate(dateController.text),
                            securityCode: cvcController.text,
                          );
                          context.read<NewCartBloc>().add(CreateNewCard(cardModel: data));

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
                                    Text('Your new card has been added.', style: AppStyle.b1Regular),
                                    SizedBox(height: 14.h),
                                    AppTextButton(
                                      text: 'Thanks',
                                      onPressed: () => context.go(Routes.payment),
                                      backgroundColor: AppColors.primary900,
                                      textColor: AppColors.primary0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      : null,
                  isLoading: state.statusCardsCreate == Status.loading,
                  borderColor: isActive ? AppColors.primary900 : AppColors.primary200,
                  backgroundColor: isActive ? AppColors.primary900 : AppColors.primary200,
                  textColor: AppColors.primary0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatDate(String mmYY) {
  final parts = mmYY.split('/');
  final month = int.parse(parts[0]);
  final year = int.parse('20${parts[1]}');
  final lastDay = DateTime(year, month + 1, 0);
  return '${lastDay.year.toString().padLeft(4, '0')}-'
      '${lastDay.month.toString().padLeft(2, '0')}-'
      '${lastDay.day.toString().padLeft(2, '0')}';
}
