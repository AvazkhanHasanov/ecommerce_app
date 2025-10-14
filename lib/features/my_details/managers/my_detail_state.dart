import 'package:ecommerce_app/data/models/auth_model/auth_me_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_detail_state.freezed.dart';

@freezed
abstract class MyDetailState with _$MyDetailState {
  const factory MyDetailState({
    required Status meStatus,
    required Status updateStatus,
    required String? updateError,
    required String? meError,

    required AuthMeModel? me,
  }) = _MyDetailState;

  factory MyDetailState.initial() => MyDetailState(
    meStatus: Status.idle,
    updateStatus: Status.idle,
    updateError: null,
    meError: null,
    me: null,
  );
}
