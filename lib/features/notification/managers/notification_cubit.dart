import 'package:ecommerce_app/data/models/notification_model.dart';
import 'package:ecommerce_app/data/repositories/notification_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/notification/managers/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
      (value) {
        final Map<String, List<NotificationModel>> grouped = {};
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final yesterday = today.subtract(Duration(days: 1));


        for (var item in value) {

          final itemDate = DateTime(item.date.year, item.date.month, item.date.day);
          String key;
          if (isSameDay(itemDate, today)) {

            key = 'Today';
          } else if (isSameDay(itemDate, yesterday)) {
            key = "Yesterday";
          } else {
            key = DateFormat('MMMM d, yyyy').format(itemDate);
          }
          print("Item: ${item.title} | Date: ${item.date} | Key: $key");

          if (grouped.containsKey(key)) {
            grouped[key]!.add(item);
          } else {
            grouped[key] = [item];
          }
        }
        emit(state.copyWith(status: Status.success, grouped: grouped));
      },
    );
  }
}
bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}