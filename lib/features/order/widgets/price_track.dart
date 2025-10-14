import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:ecommerce_app/features/order/managers/order_cubit.dart';
import 'package:ecommerce_app/features/order/widgets/review_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceTrack extends StatefulWidget {
  const PriceTrack({
    super.key,
    required this.rating,
    required this.price,
    required this.productId,
    required this.isLoading,
  });

  final int productId;
  final int price;
  final bool isLoading;
final num? rating;
  @override
  State<PriceTrack> createState() => _PriceTrackState();
}

class _PriceTrackState extends State<PriceTrack> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$ ${widget.price}', style: AppStyle.b2SemiBold),
        widget.rating != null
            ? AppTextButton(
                fontSize: 10,
                backgroundColor: AppColors.primary900,
                borderColor: AppColors.primary900,
                textColor: AppColors.primary0,
                text: 'Track Order',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => OrderCubit(orderRepo: context.read(), reviewsRepo: context.read()),
                        child: ReviewBottomSheet(
                          commentController: commentController,
                          productId: widget.productId,
                          isLoading: widget.isLoading,
                        ),
                      );
                    },
                  );
                },
                width: 90,
                height: 30,
              )
            : AppTextButtonWithRow(
                onPressed: null,
                children: [
                  SvgPicture.asset(AppIcons.star, colorFilter: ColorFilter.mode(AppColors.gold, BlendMode.srcIn)),
                  Text('$widget.review/5', style: AppStyle.b3Medium.copyWith(fontSize: 10)),
                ],
              ),
      ],
    );
  }
}
