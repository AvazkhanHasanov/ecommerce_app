import 'package:ecommerce_app/data/models/auth_update_model.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/my_details/managers/my_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_detail_event.dart';

class MyDetailBloc extends Bloc<MyDetailEvent, MyDetailState> {
  final AuthRepository _authRepo;

  MyDetailBloc({required AuthRepository authRepo}) : _authRepo = authRepo, super(MyDetailState.initial()) {
    on<GetMe>(_fetchMe);
    on<UpdateMe>(_update);
  }

  Future<void> _fetchMe(GetMe event, Emitter<MyDetailState> emit) async {
    emit(state.copyWith(meStatus: Status.loading));
    final result = await _authRepo.me();
    result.fold(
      (error) => emit(state.copyWith(meStatus: Status.error, meError: error.toString())),
      (value) => emit(
        state.copyWith(me: value, meStatus: Status.success, meError: null),
      ),
    );
  }

  Future<void> _update(UpdateMe event, Emitter<MyDetailState> emit) async {
    emit(state.copyWith(updateStatus: Status.loading));
    final result = await _authRepo.update(event.updateModel);
    result.fold(
      (error) => emit(state.copyWith(updateStatus: Status.error, updateError: error.toString())),
      (value) {
        add(GetMe());
        emit(
          state.copyWith(
            updateStatus: Status.success,
          ),
        );
      },
    );
  }
}
