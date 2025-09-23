import 'dart:async';

import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/search/manages/search_bloc.dart';
import 'package:ecommerce_app/features/search/manages/search_state.dart';
import 'package:ecommerce_app/features/search/widgets/price_and_discount.dart';
import 'package:ecommerce_app/features/search/widgets/resent_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../common/widgets/for_no_item.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    required this.searchResult,
    super.key,
  });

  final List<ProductModel> searchResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        ...List.generate(
          searchResult.length,
          (index) => Column(
            spacing: 20.h,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      searchResult[index].image,
                      width: 56.w,
                      height: 53.h,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchResult[index].title,
                          style: AppStyle.b1SemiBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        PriceAndDiscount(
                          price: searchResult[index].price,
                          discount: searchResult[index].discount,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(AppIcons.arrow),
                ],
              ),
              Divider(color: AppColors.primary100),
            ],
          ),
        ),
        if (searchResult.isEmpty)
          ForNoItem(
            icon: AppIcons.searchDuotone,
            text: 'No Results Found!',
            subtext: 'Try a similar word or something more general.',
          ),
      ],
    );
  }
}
