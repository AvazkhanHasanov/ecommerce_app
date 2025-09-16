import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
        required this.image,
    required this.text,
    required this.price,
  });


  final String image;
  final String text;
  final int price;

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
                scale: 1.9,
                child: Transform.translate(
                  offset: Offset(0, 25),
                  child: Image.asset(
                    image,
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
              child: SizedBox(
                width: 34.w,
                height: 34.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: AppColors.primary0,
                    fixedSize: Size(34.r, 34.r),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    AppIcons.like,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(text, style: AppStyle.b1SemiBold),
        Text(
          '\$$price}',
          style: AppStyle.b3Medium.copyWith(color: AppColors.primary500),
        ),
      ],
    );
  }
}
