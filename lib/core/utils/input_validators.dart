class InputValidators {
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'joyni to`ldirshi shart';
    }
    final digitsOnly = value.replaceAll(' ', '') ;
    if (digitsOnly.length != 16) {
      return 'Karta raqami 16 ta raqamdan iborat bo‘lishi kerak';
    }
    if (!RegExp(r'^\d+$').hasMatch(digitsOnly)) {
      return 'Faqat raqam kiritilishi kerak';
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    if (value == null || value.length != 5 || !value.contains('/')) {
      return 'MM/YY formatda kiriting';
    }

    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || month < 1 || month > 12) {
      return 'Oy 01–12 oralig‘ida bo‘lishi kerak';
    }

    final now = DateTime.now();
    final currentYear = int.parse(now.year.toString().substring(2));
    if (year == null || year < currentYear) {
      return 'Yil muddati tugagan';
    }

    return null;
  }

  static String? validateCVV(String? value) {
    if (value == null || value.length != 3 || !RegExp(r'^\d{3}$').hasMatch(value)) {
      return 'CVV 3 ta raqamdan iborat bo‘lishi kerak';
    }
    return null;
  }
}
