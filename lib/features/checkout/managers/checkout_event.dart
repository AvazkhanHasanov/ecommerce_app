part of 'checkout_bloc.dart';

sealed class CheckoutEvent {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class CreateOrder extends CheckoutEvent {
  final OrdersCreateModel data;

  CreateOrder({required this.data});
}

final class FetchAddress extends CheckoutEvent {}

final class FetchCards extends CheckoutEvent {}
