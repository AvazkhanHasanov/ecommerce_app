import 'package:ecommerce_app/data/models/product/saved_products_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_state.freezed.dart';

enum Status { idle, loading, success, error }

@freezed
abstract class SavedState with _$SavedState {
  const factory SavedState({
    required Status status,
    required String? errorSavedMessage,
    required List<SavedProductsModel> savedProducts,
  }) = _SavedState;

  factory SavedState.initial()=>SavedState(status: Status.idle, errorSavedMessage: null, savedProducts: []);
}
