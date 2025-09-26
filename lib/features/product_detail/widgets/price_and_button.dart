import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/data/models/add_item_model.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/product/product_sizes_model.dart';
import '../managers/product_detail_bloc.dart';
import 'app_text_button_with_padding.dart';

class SizePriceAndButton extends StatefulWidget {
  const SizePriceAndButton({
    required this.price,
    required this.isAddLoading,
    required this.size,
    required this.productId,
    super.key,
  });

  final Status isAddLoading;
  final int productId;
  final int price;
  final List<ProductSizesModel> size;

  @override
  State<SizePriceAndButton> createState() => _SizePriceAndButtonState();
}

class _SizePriceAndButtonState extends State<SizePriceAndButton> {
  int sizeId = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 13.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose size', style: AppStyle.h4SemiBold),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10.w,
                children: [
                  ...List.generate(
                    widget.size.length,
                    (index) => AppTextButtonWithPadding(
                      text: widget.size[index].title,
                      onPressed: () {
                        sizeId = widget.size[index].id;

                        setState(() {});
                      },
                      backgroundColor: sizeId == widget.size[index].id ? AppColors.primary0 : AppColors.primary200,
                      borderColor: AppColors.primary100,
                      borderWidth: 1.35.w,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: AppStyle.b1Regular.copyWith(color: AppColors.primary500),
                ),
                Text('\$ ${widget.price}', style: AppStyle.h3),
              ],
            ),
            AppTextButtonWithRow(
              isLoading: widget.isAddLoading == Status.loading,
              onPressed: () async {
                if (sizeId == -1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Iltimos, o‘lchamni tanlang')),
                  );
                  return;
                }

                AddItemModel data = AddItemModel(productId: widget.productId, sizeId: sizeId);
                context.read<ProductDetailBloc>().add(AddItem(item: data));
              },
              width: 240.w,
              children: [
                SvgPicture.asset(AppIcons.bag),
                Text(
                  'Add to Cart',
                  style: AppStyle.b1Medium.copyWith(color: AppColors.primary0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
