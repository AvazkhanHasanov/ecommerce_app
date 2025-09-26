import 'package:ecommerce_app/data/models/card/cards_create_model.dart';
import 'package:ecommerce_app/data/repositories/card_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/new_card/managers/new_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_card_event.dart';

class NewCartBloc extends Bloc<NewCardEvent, NewCardState> {
  final CardRepository _cardRepo;

  NewCartBloc({required CardRepository cardRepo}) : _cardRepo = cardRepo, super(NewCardState.initial()) {
    on<CreateNewCard>(_createNewCard);
  }

  Future<void> _createNewCard(CreateNewCard event, Emitter<NewCardState> emit) async {
    emit(state.copyWith(statusCardsCreate: Status.loading));
    final result = await _cardRepo.createCards(cardData: event.cardModel);
    result.fold(
      (error) => emit(state.copyWith(statusCardsCreate: Status.error, errorCardsCreate: error.toString())),
      (value) => emit(
        state.copyWith(
          statusCardsCreate: Status.success,
        ),
      ),
    );
  }
}
