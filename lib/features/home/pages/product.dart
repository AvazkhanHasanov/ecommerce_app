import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/heart_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.image, required this.text, required this.price, required this.discount});

  final String image;
  final String text;
  final int price;
  final num discount;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Transform.scale(
                scale: 1.5,
                child: Transform.translate(
                  offset: Offset(0, 25),
                  child: Image.network(
                    widget.image,
                    width: 161,
                    height: 174,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12.w,
              top: 12.h,
              child: HeartIcon(
                icon: isSelected ? AppIcons.heartF : AppIcons.heart,
                foregroundColor: isSelected ? AppColors.red : AppColors.primary900,
                backgroundColor: AppColors.primary0,
                onPressed: () => setState(() => isSelected = !isSelected),
              ),
            ),
          ],
        ),
        Text(widget.text, style: AppStyle.b1SemiBold, maxLines: 1),
        Text(
          '\$${widget.price} ${widget.discount == 0 ? '' : widget.discount}',
          style: AppStyle.b3Medium.copyWith(color: AppColors.primary500),
        ),
      ],
    );
  }
}
