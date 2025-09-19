import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/heart_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.image,
    required this.text,
    required this.price,
    required this.discount,
    this.imageHeight = 174,
    this.scale=1.5,
    this.dx=0,
    this.dy=25,
    required this.isLiked,
    required this.likePressed
  });

  final String image;
  final String text;
  final int price;
  final num discount;
  final double imageHeight;
  final double scale;
  final double dx,dy;
  final bool isLiked;
  final VoidCallback? likePressed;

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
                scale: scale,
                child: Transform.translate(
                  offset: Offset(dx, dy),
                  child: Image.network(
                    image,
                    width: 161.w,
                    height: imageHeight.h,

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12.w,
              top: 12.h,
              child: HeartIcon(
                onPressed: likePressed,
                icon: isLiked ? AppIcons.heartF : AppIcons.heart,
                foregroundColor: isLiked ? AppColors.red : AppColors.primary900,
                backgroundColor: AppColors.primary0,

              ),
            ),
          ],
        ),
        Spacer(),
        Text(text, style: AppStyle.b1SemiBold, maxLines: 1),
        Text(
          '\$$price ${discount == 0 ? '' : discount}',
          style: AppStyle.b3Medium.copyWith(color: AppColors.primary500),
        ),
        SizedBox(height: 5.h)
      ],
    );
  }
}
