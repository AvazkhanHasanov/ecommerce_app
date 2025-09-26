import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/reviews_model.dart';
import 'package:ecommerce_app/data/models/reviews_stats_model.dart';

abstract interface class IReviewsRepository {
  Future<Result<List<ReviewsModel>>> getAll(int productId);

  Future<Result<ReviewsStatsModel>> getStats(int productId);
}

class ReviewsRepository implements IReviewsRepository {
  final ApiClient _client;

  ReviewsRepository({required ApiClient client}) : _client = client;

  @override
  Future<Result<List<ReviewsModel>>> getAll(int productId) async {
    final response = await _client.get<List>('/reviews/list/$productId');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => ReviewsModel.toJson(x)).toList()),
    );
  }

  @override
  Future<Result<ReviewsStatsModel>> getStats(int productId) async {
    final response = await _client.get('/reviews/stats/$productId');
    return response.fold((error) => Result.error(error), (value) => Result.ok(ReviewsStatsModel.toJson(value)));
  }
}
