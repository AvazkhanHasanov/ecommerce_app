part of 'cart_bloc.dart';

sealed class CartEvent {}

class GetMyCartItems extends CartEvent {}

class DeleteMyCart extends CartEvent {
  final int id;

  DeleteMyCart({required this.id});
}

class UpdateMyCart extends CartEvent {
  final int id;
  final int quantity;
  UpdateMyCart({required this.id, required this.quantity});
}
