


part of 'my_detail_bloc.dart';


sealed class MyDetailEvent {}

class GetMe extends MyDetailEvent {}

class UpdateMe extends MyDetailEvent {
  final AuthUpdateModel updateModel;

  UpdateMe({required this.updateModel});
}