import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/search/manages/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../home/managers/home_state.dart';

part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository _productRepo;

  SearchBloc({required ProductRepository productRepo}) : _productRepo = productRepo, super(SearchState.initial()) {
    on<GetProducts>(
      _fetchProductsBySearch,
      transformer: (events, mapper) => events.debounceTime(Duration(milliseconds: 1000)).switchMap(mapper),
    );
  }

  Future<void> _fetchProductsBySearch(GetProducts event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _productRepo.getAll(queryParams: event.queryParams);
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorSearch: error.toString())),
      (value) => emit(state.copyWith(searchResult: value, status: Status.success, errorSearch: null)),
    );
  }
}
