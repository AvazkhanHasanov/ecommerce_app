import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/repositories/size_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository _categoryRepo;
  final ProductRepository _productRepo;
  final SizeRepository _sizeRepo;
  final AuthRepository _authRepo;

  HomeBloc({
    required CategoryRepository categoryRepo,
    required ProductRepository productRepo,
    required AuthRepository authRepo,
    required SizeRepository sizeRepo,
  }) : _categoryRepo = categoryRepo,
       _productRepo = productRepo,
       _authRepo = authRepo,
       _sizeRepo = sizeRepo,
       super(HomeState.initial()) {
    on<FetchCategoryEvent>(_fetchCategory);
    on<FetchProductsEvent>(_fetchProducts);
    on<LocalToggleLikeEvent>(_onLocalToggleLike);
    on<CommitLikeEvent>(
      _onCommitLike,
      transformer: (events, mapper) => events.debounceTime(Duration(milliseconds: 1000)).switchMap(mapper),
    );
    // on<FetchSize>(handler);
  }
Future<void> _fetchSize(FetchSize event,Emitter<HomeState>emit)async{
    
}
  Future<void> _fetchCategory(FetchCategoryEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _categoryRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
      (value) => emit(state.copyWith(status: Status.success, category: value)),
    );
  }

  Future<void> _fetchProducts(FetchProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(productStatus: Status.loading));
    final result = await _productRepo.getAll(queryParams: event.queryParams);
    result.fold(
      (error) => emit(state.copyWith(productStatus: Status.error, errorProduct: error.toString())),
      (value) => emit(state.copyWith(productStatus: Status.success, product: value)),
    );
  }

  Future<void> _onLocalToggleLike(LocalToggleLikeEvent event, Emitter<HomeState> emit) async {
    final index = state.product.indexWhere((element) => element.id == event.productId);
    if (index == -1) return;

    final current = state.product[index];
    final newStatus = !current.isLiked;
    final updatedProduct = current.copyWith(isLiked: newStatus);
    final updatedList = [...state.product];
    updatedList[index] = updatedProduct;
    emit(state.copyWith(product: updatedList));

    add(CommitLikeEvent(productId: event.productId, isLiked: newStatus));
  }

  Future<void> _onCommitLike(CommitLikeEvent event, Emitter<HomeState> emit) async {
    final result = event.isLiked
        ? await _authRepo.save(id: event.productId)
        : await _authRepo.unsave(id: event.productId);

    result.fold((error) {
      final index = state.product.indexWhere((p) => p.id == event.productId);
      if (index == -1) return;
      final original = state.product[index].copyWith(isLiked: !event.isLiked);
      final updatedList = [...state.product];
      updatedList[index] = original;
      emit(state.copyWith(product: updatedList));
    }, (_) {});
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
