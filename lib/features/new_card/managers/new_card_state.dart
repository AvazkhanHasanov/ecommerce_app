import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_card_state.freezed.dart';

@freezed
abstract class NewCardState with _$NewCardState {
  const factory NewCardState({
    required Status statusCardsCreate,
    required String? errorCardsCreate,

  }) = _NewCardState;

  factory NewCardState.initial() => NewCardState(
    statusCardsCreate: Status.idle,
    errorCardsCreate: null,

  );
}
