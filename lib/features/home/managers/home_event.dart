part of 'home_bloc.dart';

sealed class HomeEvent {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class FetchCategoryEvent extends HomeEvent {}

final class FetchProductsEvent extends HomeEvent {
  final Map<String, dynamic>? queryParams;

  FetchProductsEvent({this.queryParams});
}

final class LocalToggleLikeEvent extends HomeEvent {
  final int productId;

  LocalToggleLikeEvent({required this.productId});
}

final class CommitLikeEvent extends HomeEvent {
  final int productId;
  final bool isLiked;

  CommitLikeEvent({required this.productId, required this.isLiked});
}
