import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_bloc.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_state.dart';
import 'package:ecommerce_app/features/product_detail/pages/product_image_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPages extends StatelessWidget {
  const ProductDetailPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ProductDetailBloc(productRepo: context.read());
        bloc.add(GetProductById(id: 2));
        return bloc;
      },
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == Status.error) {
            return Center(
              child: Text(state.errorProduct ?? 'Xatolik yuz berid'),
            );
          }
          if (state.product == null) {
            return const Center(child: Text('Maxsulot topilmadi'));
          }
          return Scaffold(
            appBar: StoreAppBar(title: 'Details'),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  ProductImageStack(image: state.product!.productImages[0].image),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
