import 'dart:async';

import 'package:ecommerce_app/features/common/widgets/app_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/search/manages/search_bloc.dart';
import 'package:ecommerce_app/features/search/manages/search_state.dart';
import 'package:ecommerce_app/features/search/widgets/resent_search_view.dart';
import 'package:ecommerce_app/features/search/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final controller = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  final searchBox = Hive.box<String>('recentSearches');
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: StoreAppBar(
            title: 'Search',
            needDivider: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                spacing: 16.h,
                children: [
                  AppTextField(
                    controller: controller,
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(
                        Duration(seconds: 1),
                        () {
                          if (controller.text.isNotEmpty) {
                            searchBox.add(controller.text);
                          }
                        },
                      );
                      context.read<SearchBloc>().add(
                        GetProducts(queryParams: {'Title': controller.text}),
                      );
                    },
                  ),
                  controller.text.isEmpty
                    ? ResentSearchView(searchBox: searchBox)
                  : SearchResult(searchResult: state.searchResult),


                ],
              ),
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(),
        );
      },
    );
  }
}
