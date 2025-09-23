import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_bloc.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_state.dart';
import 'package:ecommerce_app/features/product_detail/widgets/all_reviews.dart';
import 'package:ecommerce_app/features/product_detail/widgets/description_part.dart';
import 'package:ecommerce_app/features/product_detail/widgets/price_and_button.dart';
import 'package:ecommerce_app/features/product_detail/widgets/product_image_stack.dart';
import 'package:ecommerce_app/features/product_detail/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_detail/widgets/rating_with_star.dart';
import 'package:ecommerce_app/features/product_detail/widgets/stats_with_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPages extends StatelessWidget {
  const ProductDetailPages({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ProductDetailBloc(
          reviewsRepo: context.read(),
          productRepo: context.read<ProductRepository>(),
        );
        bloc.add(GetReviews(productId: id));
        bloc.add(GetReviewsStat(productId: id));
        bloc.add(GetProductById(id: id));
        return bloc;
      },
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state.productStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.productStatus == Status.error) {
            return Center(
              child: Text(state.errorProduct ?? 'Xatolik yuz berid'),
            );
          }
          if (state.product == null) {
            return const Center(child: Text('Maxsulot topilmadi'));
          }
          return Scaffold(
            appBar: StoreAppBar(title: 'Details'),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  spacing: 12.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            state.product!.productImages.length,
                            (index) => ProductImageStack(
                              image: state.product!.productImages[index].image,
                              isLiked: state.product!.isLiked,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DescriptionPart(
                      title: state.product!.title,
                      reviewsCount: state.product!.reviewsCount,
                      rating: state.product!.rating,
                      description: state.product!.description,
                    ),
                    ProductSize(size: state.product!.productSizes),
                    PriceAndButton(price: state.product!.price),
                    RatingWithStar(
                      reviewsCount: state.product!.reviewsCount,
                      rating: state.product!.rating,
                    ),
                    StatsWithStar(
                      oneStars: state.stats!.oneStars,
                      twoStars: state.stats!.twoStars,
                      threeStars: state.stats!.threeStars,
                      fourStars: state.stats!.fourStars,
                      fiveStars: state.stats!.fiveStars,
                      totalStars: state.stats!.totalCount,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.product!.reviewsCount} Reviews',
                          style: AppStyle.b1SemiBold,
                        ),
                        Text(
                          'Most Relevant',
                          style: AppStyle.b3Medium.copyWith(
                            color: AppColors.primary500,
                          ),
                        ),
                      ],
                    ),
                    AllReviews(reviews: state.reviews,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
