import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/question/managers/question_cubit.dart';
import 'package:ecommerce_app/features/question/managers/question_state.dart';
import 'package:ecommerce_app/features/question/widgets/for_question.dart';
import 'package:ecommerce_app/features/question/widgets/cat_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  final ScrollController scrollController=ScrollController();
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    searchController.dispose();
  }

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'FAQs'),
      body: BlocProvider(
        create: (context) => QuestionCubit(questionRepo: context.read(), categoryRepo: context.read()),
        child: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state.categoryStatus == Status.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.questionStatus == Status.loading) {
              return Center(child: CircularProgressIndicator());
            }
            late final List<bool> expanded = List.generate(state.question.length, (index) => false);
            return SingleChildScrollView(
              child: Column(
                spacing: 16.h,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8.w,
                        children: [
                          ...List.generate(
                            state.category.length,
                            (index) => CatContainer(
                              text: state.category[index].title,
                              textColor: selectedItem == index ? AppColors.primary0 : AppColors.primary900,
                              backgroundColor: selectedItem == index ? AppColors.primary900 : AppColors.primary0,
                              borderColor: selectedItem == index ? AppColors.primary900 : AppColors.primary100,
                              onTap: () {
                                setState(() => selectedItem = index);
                                context.read<QuestionCubit>().fetchQuestion(queryParams: {'CategoryId': selectedItem});
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24.w, left: 24.w),
                    child: Column(
                      spacing: 16.h,
                      children: [
                        AppTextField(
                          hintText: 'Search for questions...',
                          controller: searchController,
                        ),
                        if (state.question.isNotEmpty)
                          ...List.generate(
                            state.question.length,
                            (index) => ForQuestion(
                              question: state.question[index].title,
                              answer: state.question[index].answer,
                              turns: expanded[index],
                              onChanged: (value) => setState(() => expanded[index] = value),
                            ),
                          )
                        else
                          Center(
                            child: Text('Be the first to ask a question!',style: AppStyle.b2SemiBold.copyWith(color: AppColors.primary500),),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
