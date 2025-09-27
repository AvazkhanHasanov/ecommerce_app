import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    if (digitsOnly.length >= 2) {
      formatted = digitsOnly.substring(0, 2);
      if (digitsOnly.length > 2) {
        formatted += '/${digitsOnly.substring(2, digitsOnly.length.clamp(2, 4))}';
      }
    } else {
      formatted = digitsOnly;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}