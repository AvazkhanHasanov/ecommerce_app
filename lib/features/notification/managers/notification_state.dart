import 'package:ecommerce_app/data/models/notification_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    required Status status,
    required String? errorNotification,
    required Map<String,List<NotificationModel>> grouped,
  }) = _NotificationState;

  factory NotificationState.initial() =>
      NotificationState(status: Status.idle, errorNotification: null, grouped: {});
}
