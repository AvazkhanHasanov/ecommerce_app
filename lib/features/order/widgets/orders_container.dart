import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/features/order/widgets/price_track.dart';
import 'package:ecommerce_app/features/order/widgets/title_size_status.dart';

class OrdersContainer extends StatelessWidget {
  const OrdersContainer({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.price,
    required this.status,
    required this.productId,
  });
final int productId;
  final String status;
  final String title;
  final String image;
  final String size;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColors.primary100),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.network(
              alignment: Alignment.centerLeft,
              image,
              width: 70.w,
              height: 79.h,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSizeStatus(title: title, size: size, status: status),
                PriceTrack(
                  productId:productId,
                  price: price,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
