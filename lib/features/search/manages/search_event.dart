part of 'search_bloc.dart';

sealed class SearchEvent {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class GetProducts extends SearchEvent {
  final Map<String, dynamic>? queryParams;

  GetProducts({this.queryParams});
}
