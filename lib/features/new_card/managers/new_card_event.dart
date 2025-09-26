part of 'new_card_bloc.dart';

sealed class NewCardEvent {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

class CreateNewCard extends NewCardEvent {
  final CardsCreateModel cardModel;

  CreateNewCard({required this.cardModel});
}
