import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/features/cart/widgets/price_and_count.dart';
import 'package:ecommerce_app/features/cart/widgets/title_and_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.id,
    required this.price,
    required this.count,
    required this.title,
    required this.size,
    required this.image
  });
final int id;
  final int price;
  final int count;
  final String title;
  final String size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      width: 342.w,
      height: 107.h,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColors.primary100),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(4.r),
            child: Image.network(image),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleAndSize(title: title, size: size, id: id),
                PriceAndCount(price: price, count: count),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
