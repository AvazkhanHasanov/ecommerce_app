class ReviewsCreateModel {
  final int productId;
  final num rating;

  final String comment;

  ReviewsCreateModel({
    required this.productId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'rating': rating,
      'comment': comment,
    };
  }
}
