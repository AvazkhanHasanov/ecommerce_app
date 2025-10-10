import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/size_model.dart';

class SizeRepository {
  final ApiClient _client;

  SizeRepository({required ApiClient client}) : _client = client;

  Future<Result<List<SizeModel>>> getAll() async {
    final result = await _client.get<List>('/sizes/list');
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => SizeModel.fromJson(x)).toList()),
    );
  }
}
