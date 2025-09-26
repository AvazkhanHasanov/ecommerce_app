import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/features/search/widgets/price_and_discount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
              InkWell(
                onTap: ()=> context.push(Routes.getProductDetail(searchResult[index].id)),
                child: Row(
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
