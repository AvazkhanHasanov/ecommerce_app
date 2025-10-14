import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/cart/managers/cart_bloc.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndSize extends StatelessWidget {
  const TitleAndSize({
    super.key,
    required this.id,
    required this.title,
    required this.size,
  });
final int id;
  final String title;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyle.b2SemiBold,overflow: TextOverflow.ellipsis),
              Text('Size $size', style: AppStyle.b3Regular.copyWith(color: AppColors.primary500)),
            ],
          ),
        ),

        AppIconButton(
          padding: EdgeInsets.zero,
          foregroundColor: AppColors.red,
          size: Size(24.r, 24.r),
          icon: AppIcons.trash,
          onPressed: () {
            context.read<CartBloc>().add(DeleteMyCart(id: id));
          },
        ),
      ],
    );
  }
}
