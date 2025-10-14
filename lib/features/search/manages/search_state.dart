import 'package:ecommerce_app/data/models/product/product_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    required Status status,
    required String? errorSearch,
    required List<ProductModel> searchResult,
  }) = _SearchState;

  factory SearchState.initial() => SearchState(
    status: Status.idle,
    errorSearch: null,
    searchResult: [],
  );
}
