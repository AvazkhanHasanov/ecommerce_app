class ReviewsModel {
  final int id;
  final String comment;
  final int rating;
  final DateTime created;
  final String createdString;
  final String userFullName;

  ReviewsModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.created,
    required this.createdString,
    required this.userFullName,
  });

  factory ReviewsModel.toJson(Map<String, dynamic> json) {
    final date = DateTime.parse(json['created']);
    return ReviewsModel(
      id: json['id'],
      comment: json['comment'],
      rating: json['rating'],
      createdString: data(date),
      created: date,
      userFullName: json['userFullName'],
    );
  }

  static String data(DateTime created) {
    DateTime now = DateTime.now();
    Duration time = now.difference(created);
    if (time.inDays >= 365) {
      var result = time.inDays ~/ 365;
      return '$result yil oldin ';
    } else {
      if (time.inDays >= 30) {
        var result = (time.inDays) ~/ 30;
        return '$result oy oldin ';
      } else if (time.inDays >= 7) {
        var result = time.inDays ~/ 7;
        return '$result hafta oldin ';
      } else if (time.inDays >= 1) {
        return '${time.inDays} kun oldin ';
      } else if (time.inHours >= 1) {
        var result = time.inHours;
        return '$result soat oldin ';
      } else {
        return 'Hozirgina ';
      }
    }
  }
}
