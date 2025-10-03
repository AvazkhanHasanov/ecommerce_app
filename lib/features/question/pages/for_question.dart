import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForQuestion extends StatelessWidget {
  const ForQuestion({
    super.key,
    required this.question,
    required this.answer,
    required this.turns,
    this.onChanged,
  });

  final String question;
  final String answer;
  final bool turns;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: BoxBorder.all(color: AppColors.primary100)
      ),
      child: ExpansionTile(
        collapsedIconColor: AppColors.primary900,
        iconColor: AppColors.primary900,
        onExpansionChanged: onChanged,
        dense: true,
        shape: Border(),

        trailing: AnimatedRotation(
          turns:turns? -0.25:0.25,
          duration: Duration(milliseconds: 200),
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(question,style: AppStyle.b1Medium),
        children: [Padding(
          padding:  EdgeInsets.only(left: 18.w),
          child: Text(answer,style: AppStyle.b3Regular.copyWith(color: AppColors.primary500),),
        )],
      ),
    );
  }
}
