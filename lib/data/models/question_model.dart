class QuestionModel {
  final int id;
  final String title;
  final String answer;
  final int order;

  QuestionModel({
    required this.id,
    required this.title,
    required this.answer,
    required this.order,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      title: json['title'],
      answer: json['answer'],
      order: json['order'],
    );
  }
}
