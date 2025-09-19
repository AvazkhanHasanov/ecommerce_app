import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/saved/managers/saved_cubit.dart';
import 'package:ecommerce_app/features/saved/managers/saved_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/product.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(),
      body: BlocProvider(
        create: (context) => SavedCubit(productRepo: context.read()),
        child: BlocBuilder<SavedCubit, SavedState>(
          builder: (context, state) => GridView.builder(
            itemCount: state.savedProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 161 / 172,
            ),
            itemBuilder: (context, index) {
              return Center(
                child: Product(
                  likePressed: () {},
                  dy: 20,
                  scale: 1.4,
                  imageHeight: 152.h,
                  isLiked: state.savedProducts[index].isLiked,
                  discount: state.savedProducts[index].discount,
                  image: state.savedProducts[index].image,
                  text: state.savedProducts[index].title,
                  price: state.savedProducts[index].price,
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
