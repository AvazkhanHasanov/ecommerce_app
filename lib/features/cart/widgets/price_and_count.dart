import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/features/cart/managers/cart_bloc.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndCount extends StatefulWidget {
  const PriceAndCount({
    super.key,
    required this.price,
    required this.quantity,
    required this.id,
  });

  final int price;
  final int quantity;
  final int id;

  @override
  State<PriceAndCount> createState() => _PriceAndCountState();
}

class _PriceAndCountState extends State<PriceAndCount> {
  late int count;

  @override
  void initState() {
    count = widget.quantity;
    super.initState();
  }

  void updateQuantity(int newQuantity, BuildContext context) {
    setState(() => count = newQuantity);
    context.read<CartBloc>().add(UpdateMyCart(id: widget.id, quantity: newQuantity));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('\$${widget.price}'),

        Row(
          spacing: 9.w,
          children: [
            AppIconButton(
              radius: 3.r,
              borderColor: AppColors.primary200,
              size: Size(24.r, 24.r),
              icon: AppIcons.minus,
              onPressed: widget.quantity > 1 ? () => updateQuantity(count - 1, context) : null,
            ),
            Text('${widget.quantity}'),
            AppIconButton(
              radius: 3.r,
              borderColor: AppColors.primary200,
              size: Size(24.r, 24.r),
              icon: AppIcons.plus,
              onPressed: () => updateQuantity(count + 1, context),
            ),
          ],
        ),
      ],
    );
  }
}
