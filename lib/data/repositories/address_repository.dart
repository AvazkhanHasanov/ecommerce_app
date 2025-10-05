import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/address_create_model.dart';
import 'package:ecommerce_app/data/models/address_model.dart';

class AddressRepository {
  final ApiClient _client;

  AddressRepository({required ApiClient client}) : _client = client;

  Future<Result> addressCreate({required AddressCreateModel createData}) async {
    final response = await _client.post('/addresses/create', data: createData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  Future<Result<List<AddressModel>>> getAddress() async {
    final response = await _client.get<List>('/addresses/list');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => AddressModel.fromJson(x)).toList()),
    );
  }
}
