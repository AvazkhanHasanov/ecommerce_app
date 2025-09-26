import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Payment Method'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved Cards', style: AppStyle.b1SemiBold),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: BoxBorder.all(color: AppColors.primary100),
                  ),
                  child: Row(
                    children: [
                      Text('data', style: AppStyle.b2SemiBold),
                      Radio(
                        value: true,
                      ),

                    ],
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
    );
  }
}
