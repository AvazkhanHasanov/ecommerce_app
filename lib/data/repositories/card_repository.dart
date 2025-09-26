import 'package:ecommerce_app/data/models/card/cards_create_model.dart';
import 'package:ecommerce_app/data/models/card/cards_list_model.dart';

import '../../core/client.dart';
import '../../core/utils/result.dart';

abstract interface class ICardRepository {

  Future<Result<CardsCreateModel>> createCards({required CardsCreateModel cardData});
  Future<Result<List<CardsListModel>>> getAllCards();
  Future<Result> deleteCard({required int id});
}

class CardRepository implements ICardRepository {
  final ApiClient _client;

  CardRepository({required ApiClient client}) : _client = client;

  @override
  Future<Result<CardsCreateModel>> createCards({required CardsCreateModel cardData}) async {
    final response = await _client.post('/cards/create', data: cardData.toJson());
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value),
    );
  }

  @override
  Future<Result<List<CardsListModel>>> getAllCards() async {
    final response = await _client.get<List>('/cards/list');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => CardsListModel.fromJson(x)).toList()),
    );
  }

  @override
  Future<Result> deleteCard({required int id}) async {
    final response = await _client.delete('/cards/delete/$id');
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }
}
