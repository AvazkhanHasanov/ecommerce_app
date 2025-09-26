import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/notification_model.dart';

abstract interface class INotificationRepository {
  Future<Result<List<NotificationModel>>> getAll();
}
   
class NotificationRepository implements INotificationRepository{
  final ApiClient _client;

  NotificationRepository({required ApiClient client}) : _client = client;

  @override
  Future<Result<List<NotificationModel>>> getAll() async {
    final response = await _client.get<List>('/notifications/list');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => NotificationModel.fromJson(x)).toList()),
    );
  }
}
