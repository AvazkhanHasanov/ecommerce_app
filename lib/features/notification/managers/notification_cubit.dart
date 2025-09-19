import 'package:ecommerce_app/data/repositories/notification_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/notification/managers/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _notificationRepo;

  NotificationCubit({required NotificationRepository notificationRepo})
    : _notificationRepo = notificationRepo,
      super(NotificationState.initial());

  Future<void> fetchNotification() async {
    emit(state.copyWith(status: Status.loading));
    final result = await _notificationRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorNotification: error.toString())),
      (value) => emit(state.copyWith(status: Status.success, notification: value)),
    );
  }
}
