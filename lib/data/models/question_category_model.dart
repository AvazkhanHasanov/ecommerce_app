class QuestionCategoryModel {
  final int id;
  final String title;
  final int order;

  QuestionCategoryModel({
    required this.id,
    required this.title,
    required this.order,
  });

  factory QuestionCategoryModel.fromJson(Map<String, dynamic> json) {
    return QuestionCategoryModel(
      id: json['id'],
      title: json['title'],
      order: json['order'],
    );
  }
}
