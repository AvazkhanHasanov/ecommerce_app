import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/data/models/size_model.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/home/managers/home_bloc.dart';
import 'package:ecommerce_app/features/product_detail/widgets/app_text_button_with_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePageBottomSheet extends StatefulWidget {
  const HomePageBottomSheet({
    super.key,
    required this.size,
  });

  final List<SizeModel> size;

  @override
  State<HomePageBottomSheet> createState() => _HomePageBottomSheetState();
}

class _HomePageBottomSheetState extends State<HomePageBottomSheet> {
  List filter = ['Relevance', 'Price: Low - High', 'Price: High - Low'];
  List filterValue = ['date', 'price', 'minusprice'];

  //price min=>max
  //minusprice max=>min
  String? _selectedSizeId;

  int selectedItem = 0;
  RangeValues priceRange = const RangeValues(0, 19);

  @override
  void initState() {
    super.initState();
    _selectedSizeId = widget.size.isNotEmpty ? widget.size.first.id.toString() : null;
  }

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
                    onPressed: () => setState(() => selectedItem = index),
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
              Text(
                '\$${priceRange.start.round()} - \$${priceRange.end.round()}',
                style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
              ),
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
              DropdownButton<String>(
                value: widget.size.any((s) => s.id.toString() == _selectedSizeId) ? _selectedSizeId : null,
                hint: const Text("Select size"),
                items: widget.size.map((size) {
                  return DropdownMenuItem<String>(
                    value: size.id.toString(),
                    child: Text(size.title),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedSizeId = value),
              ),
            ],
          ),
          AppTextButton(
            text: 'Apply Filters',
            onPressed: () {
              final filters = <String, dynamic>{};
              if (_selectedSizeId != null) filters['SizeId'] = _selectedSizeId;
              filters['MinPrice'] = priceRange.start.round();
              filters['MaxPrice'] = priceRange.end.round();
              filters['OrderBy'] = filterValue[selectedItem];

              context.read<HomeBloc>().add(FetchProductsEvent(queryParams: filters));
              context.pop();
            },
            backgroundColor: AppColors.primary900,
            textColor: AppColors.primary0,
          ),
          Text('${filterValue[selectedItem]},${priceRange.start.round()},${priceRange.end.round()},'),
        ],
      ),
    );
  }
}
