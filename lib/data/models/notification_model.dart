class NotificationModel {
  final int id;
  final String title;
  final String icon;
  final String content;
  final String date;// buni dataTimega o`tkaz

  NotificationModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.content,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      content: json['content'],
      date: json['date'],
    );
  }
}
