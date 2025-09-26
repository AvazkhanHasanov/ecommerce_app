import 'package:ecommerce_app/data/repositories/card_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/payment/managers/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_event.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CardRepository _cardRepo;

  PaymentBloc({required CardRepository cardRepo}) : _cardRepo = cardRepo, super(PaymentState.initial()) {
    on<GetCards>(_fetchCards);
  }

  Future<void> _fetchCards(PaymentEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(statusCards: Status.loading));
    final result = await _cardRepo.getAllCards();
    result.fold(
      (error) => emit(state.copyWith(statusCards: Status.error, errorCards: error.toString())),
      (value) => emit(state.copyWith(statusCards: Status.success, cards: value, errorCards: null)),
    );
  }
}
