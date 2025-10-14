import 'package:freezed_annotation/freezed_annotation.dart';

import '../../home/managers/home_state.dart';

part 'chat_state.freezed.dart';


@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    required Status status,
    required List<Map<String, dynamic>> messages,
  }) = _ChatState;

  factory ChatState.initial() {
    return ChatState(status: Status.idle, messages: []);
  }
}
