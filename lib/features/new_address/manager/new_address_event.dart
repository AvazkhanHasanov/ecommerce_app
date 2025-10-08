
part of 'new_address_bloc.dart';

sealed class NewAddressEvent{
  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class CreateAddress extends NewAddressEvent{
  final AddressCreateModel data;
  CreateAddress({required this.data});
}