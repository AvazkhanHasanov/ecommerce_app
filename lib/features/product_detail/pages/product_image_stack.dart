import 'package:ecommerce_app/features/common/widgets/heart_Icon.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_bloc.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageStack extends StatelessWidget {
  const ProductImageStack({
    super.key,
    required this.image,
  });

  final String image;

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
        // HeartIcon(
        //   foregroundColor: foregroundColor,
        //   backgroundColor: backgroundColor,
        //   icon: icon,
        // ),
      ],
    );
  }
}
