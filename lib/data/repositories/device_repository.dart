import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';

class DeviceRepository {
  final ApiClient _client;

  DeviceRepository({required ApiClient client}) : _client = client;

  Future<Result> postDevice({required String fcmToken}) async {
    final response = await _client.post('/devices/create', data: {"fcmToken": fcmToken});
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }
}
