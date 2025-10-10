import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/product_detail/widgets/app_text_button_with_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePageBottomSheet extends StatefulWidget {
  const HomePageBottomSheet({
    super.key,
  });

  @override
  State<HomePageBottomSheet> createState() => _HomePageBottomSheetState();
}

class _HomePageBottomSheetState extends State<HomePageBottomSheet> {
  List filter = ['Relevance', 'Price: Low - High', 'Price: High - Low'];
  List filterValue=['date','price','minusprice'];
  //price min=>max
  //minusprice max=>min
  int selectedItem = 0;
   RangeValues priceRange = const RangeValues(0, 19);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 64.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filters', style: AppStyle.h4SemiBold),
              IconButton(
                onPressed: () => context.pop(),
                icon: SvgPicture.asset(AppIcons.cancel),
              ),
            ],
          ),
          Divider(color: AppColors.primary100),
          Text('Sort By', style: AppStyle.b1SemiBold),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8.w,
              children: [
                ...List.generate(
                  filter.length,
                  (index) => AppTextButtonWithPadding(
                    onPressed: () {
                      selectedItem = index;
                      setState(() {});
                    },
                    text: filter[index],
                    height: 36,
                    backgroundColor: selectedItem == index ? AppColors.primary900 : AppColors.primary0,
                    borderColor: selectedItem == index ? AppColors.primary900 : AppColors.primary100,
                    textColor: selectedItem == index ? AppColors.primary0 : AppColors.primary900,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.primary100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: AppStyle.b1SemiBold),
              Text('\$ 0 - \$ 19', style: AppStyle.b1Regular.copyWith(color: AppColors.primary500)),
            ],
          ),
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 1000,
            divisions: 30,
            activeColor: AppColors.primary900,
            inactiveColor: AppColors.primary200,
            labels: RangeLabels(
              '\$${priceRange.start.round()}',
              '\$${priceRange.end.round()}',
            ),
            onChanged: (RangeValues newRange) => setState(() => priceRange = newRange),
          ),
          Divider(color: AppColors.primary100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Size', style: AppStyle.b1SemiBold),
              Text('', style: AppStyle.b1Regular.copyWith(color: AppColors.primary500)),
            ],
          ),
          AppTextButton(
            text: 'Apply Filters',
            onPressed: () {},
            backgroundColor: AppColors.primary900,
            textColor: AppColors.primary0,
          ),
          Text('${filterValue[selectedItem]},${priceRange.start.round()},${priceRange.end.round()}'),
        ],
      ),
    );
  }
}
