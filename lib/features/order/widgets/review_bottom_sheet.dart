import 'package:ecommerce_app/core/context_extensions.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/app_icon_button.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/icons.dart';
import '../../../data/models/review/reviews_create_model.dart';
import '../../home/widgets/app_text_field.dart';
import '../managers/order_cubit.dart';
import 'create_star.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({
    super.key,
    required this.commentController,
    required this.productId,
    required this.isLoading,
  });

  final TextEditingController commentController;
  final int productId;
  final bool isLoading;

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          spacing: 14.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 64.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Leave a Review', style: AppStyle.h4SemiBold),
                AppIconButton(icon: AppIcons.cancel, onPressed: () => context.pop(), size: Size(24, 24)),
              ],
            ),
            2.height,
            Divider(color: AppColors.primary100),
            2.height,

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text('How was your order?', style: AppStyle.b1SemiBold),
                Text(
                  'Please give your rating and also your review.',
                  style: AppStyle.b2Regular.copyWith(color: AppColors.primary500),
                ),
                14.height,
                CreateStar(ratingChanging: (value) => setState(() => rating = value)),
                14.height,

                AppTextField(
                  controller: widget.commentController,
                  hintText: '  Write your  review...',
                  needSuffix: false,
                  needPrefix: false,
                  maxLines: 3,
                ),
                const SizedBox(height: 12),

                AppTextButton(
                  isLoading: widget.isLoading,
                  text: 'submit',
                  onPressed: () {
                    if (rating == 0 || widget.commentController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('rating qo`ying'),
                        ),
                      );
                      return;
                    }
                    final data = ReviewsCreateModel(
                      productId: widget.productId,
                      rating: rating,
                      comment: widget.commentController.text,
                    );
                    context.read<OrderCubit>().createReview(data: data);

                    context.pop();
                  },
                  borderColor: AppColors.primary900,
                  backgroundColor: AppColors.primary900,
                  textColor: AppColors.primary0,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
