import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/payment/managers/payment_bloc.dart';
import 'package:ecommerce_app/features/payment/managers/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

List<PaymentCard> cards = [
  PaymentCard(brand: 'VISA', last4: '2512', id: 1),
  PaymentCard(brand: 'MasterCard', last4: '5421', id: 2),
  PaymentCard(brand: 'VISA', last4: '2512', id: 3),
];

int? selectedCardId = 1; // default tanlangan

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Payment Method'),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Saved Cards', style: AppStyle.b1SemiBold),
              Column(
                children: [
                  // ForCard(code: '1234567812345678',),
                  RadioGroup<int>(
                    groupValue: selectedCardId,
                    onChanged: (newId) => setState(() => selectedCardId = newId),
                    child: Column(
                      children: cards.map((card) {
                        return ListTile(
                          leading: Radio<int>(
                            value: card.id,
                            groupRegistry: RadioGroup.maybeOf<int>(context),
                          ),
                          title: Text('${card.brand} •••• ${card.last4}'),
                          subtitle: card.id == selectedCardId ? Text('Default') : null,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Spacer(),
              AppTextButton(
                text: 'Apply',
                onPressed: () {},
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

class PaymentCard {
  final String brand; // Masalan: 'VISA', 'MasterCard'
  final String last4; // Oxirgi 4 raqam: '2512', '5421'
  final int id; // Unikal ID (tanlash uchun)

  PaymentCard({
    required this.brand,
    required this.last4,
    required this.id,
  });
}
