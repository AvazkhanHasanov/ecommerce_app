part of 'payment_bloc.dart';

sealed class PaymentEvent{
  @override
  String toString() {
    return runtimeType.toString();
  }
}
class GetCards extends PaymentEvent{

}