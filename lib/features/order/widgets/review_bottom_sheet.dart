import 'package:ecommerce_app/data/models/review/reviews_create_model.dart';
import 'package:ecommerce_app/features/order/managers/order_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_star.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/colors.dart';
import 'package:go_router/go_router.dart';
import '../../home/widgets/app_text_field.dart';
import '../../common/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showReviewBottomSheet(BuildContext context, {required int productId}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      int rating = 0;
      final TextEditingController commentController = TextEditingController();
      return StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
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
                  IconButton(onPressed: () => context.pop(), icon: SvgPicture.asset(AppIcons.cancel)),
                ],
              ),
              Divider(color: AppColors.primary100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    'How was your order?',
                    style: AppStyle.b1SemiBold,
                  ),
                  Text(
                    'Please give your rating and also your review.',
                    style: AppStyle.b2Regular.copyWith(color: AppColors.primary500),
                  ),
                  CreateStar(ratingChanging: (value) => setState(() => rating = value)),
                  AppTextField(
                    controller: commentController,
                    hintText: '  Write your  review...',
                    needSuffix: false,
                    needPrefix: false,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),

                  AppTextButton(
                    text: 'submit',
                    onPressed: () {
                      if (rating == 0 || commentController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('rating qo`ying'),
                          ),
                        );
                        return;
                      }

                      final data = ReviewsCreateModel(
                        productId: productId,
                        rating: rating,
                        comment: commentController.text,
                      );
                      context.read<OrderCubit>().createReview(data: data);
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
    },
  );
}
