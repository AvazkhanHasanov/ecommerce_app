import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles.dart';

class ForCard extends StatelessWidget {
  const ForCard({
    required this.cardId,
    required this.groupRegistry,

    required this.code,
    super.key,

  });
final String code;
  final int cardId;
  final RadioGroupRegistry<int>? groupRegistry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: BoxBorder.all(color: AppColors.primary100),
      ),
      child: Row(
        children: [
          Text(yuldizli(code), style: AppStyle.b2SemiBold),
          Radio<int>(
            value: cardId,
            groupRegistry: groupRegistry,
          ),
        ],
      ),
    );
  }
}
String yuldizli(String fullCode) {
  if (fullCode.length != 16) return fullCode;
  final last4 = fullCode.substring(12);
  return '**** **** **** $last4';
}