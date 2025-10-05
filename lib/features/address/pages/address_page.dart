import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Address'),
    );
  }
}
