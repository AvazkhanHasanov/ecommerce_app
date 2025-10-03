import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:ecommerce_app/features/question/pages/for_question.dart';
import 'package:ecommerce_app/features/question/widgets/cat_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final searchController = TextEditingController();
  List myCategory = ['General', 'Account', 'Service', 'Payment'];
  List<Map<String, dynamic>> question = List.generate(
    9,
    (index) => {
      'question': 'How do I make a purchase?',
      'answer':
          '''When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the "Add to Cart" button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.''',
    },
  );

  late final List<bool> _expanded = List.generate(question.length, (index) => false);

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'FAQs'),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16.h,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.w,
                  children: [
                    ...List.generate(
                      myCategory.length,
                      (index) => CatContainer(
                        text: myCategory[index],
                        textColor: selectedItem == index ? AppColors.primary0 : AppColors.primary900,
                        backgroundColor: selectedItem == index ? AppColors.primary900 : AppColors.primary0,
                        borderColor: selectedItem == index ? AppColors.primary900 : AppColors.primary100,
                        onTap: () => setState(() => selectedItem = index),
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
                  ...List.generate(
                    question.length,
                    (index) => ForQuestion(
                      question: question[index]['question'],
                      answer: question[index]['answer'],
                      turns: _expanded[index],
                      onChanged: (value) => setState(() => _expanded[index]=value),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
