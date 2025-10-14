import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/address_model/address_create_model.dart';
import 'package:ecommerce_app/data/models/address_model/address_detail_model.dart';
import 'package:ecommerce_app/data/models/address_model/address_model.dart';

class AddressRepository {
  final ApiClient _client;

  AddressRepository({required ApiClient client}) : _client = client;

  Future<Result> addressCreate({required AddressCreateModel createData}) async {
    final response = await _client.post('/addresses', data: createData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  Future<Result<List<AddressModel>>> getAddress() async {
    final response = await _client.get<List>('/addresses');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => AddressModel.fromJson(x)).toList()),
    );
  }

  Future<Result<AddressDetailMode>> getAddressById({required int id}) async {
    final response = await _client.get('/addresses/$id');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(AddressDetailMode.fromJson(value)),
    );
  }

  Future<Result> patchById({required int id, required AddressDetailMode data}) async {
    final response = await _client.patch('addresses/$id', data: data.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  Future<Result> deleteAddress({required int id}) async {
    final response = await _client.delete('/address/$id');
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }
}
