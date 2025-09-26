part of 'cart_bloc.dart';

sealed class CartEvent{}

class GetMyCartItems extends CartEvent{}
class DeleteMyCart extends CartEvent{
  final int id;
  DeleteMyCart({required this.id});
}