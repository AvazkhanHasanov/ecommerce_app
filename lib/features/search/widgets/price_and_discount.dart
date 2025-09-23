import 'dart:async';

import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/search/manages/search_bloc.dart';
import 'package:ecommerce_app/features/search/manages/search_state.dart';
import 'package:ecommerce_app/features/search/widgets/resent_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class PriceAndDiscount extends StatelessWidget {
  const PriceAndDiscount({
    required this.discount,
    required this.price,
    super.key,
  });

  final int price;
  final num discount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\$ $price',
        style: AppStyle.b3Medium.copyWith(color: AppColors.primary500),
        children: discount != 0
            ? [
                TextSpan(
                  text: ' -$discount%',
                  style: AppStyle.b3Medium.copyWith(color: AppColors.red),
                ),
              ]
            : [],
      ),
    );
  }
}
