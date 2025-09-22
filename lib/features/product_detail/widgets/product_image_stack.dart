import 'package:ecommerce_app/features/common/widgets/heart_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';

class ProductImageStack extends StatelessWidget {
  const ProductImageStack({super.key, required this.image, required this.isLiked, this.likePressed});

  final String image;
  final VoidCallback? likePressed;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            width: 341.w,
            height: 368.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 12.w,
          top: 12.h,
          child:  HeartIcon(
            onPressed: likePressed,
            icon: isLiked ? AppIcons.heartF : AppIcons.heart,
            foregroundColor: isLiked ? AppColors.red : AppColors.primary900,
            backgroundColor: AppColors.primary0,
          ),
        ),
      ],
    );
  }
}
