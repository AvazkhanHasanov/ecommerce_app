import '../../../data/models/card/cards_list_model.dart';

String getCardNumberById(List<CardsListModel>? cards, int? id) {

  if (cards == null || cards.isEmpty) return '';
  if (id == null) {

    return cards.first.cardNumber;
  }

  try {
    final foundCard = cards.firstWhere((card) => card.id == id);
    return foundCard.cardNumber;
  } catch (e) {
    return '$e';
  }
}
