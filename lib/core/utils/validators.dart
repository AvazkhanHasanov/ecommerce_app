class Validators {
  static final _emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final _passwordRegExp = RegExp(r'^[0-9]+$');

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid email address';
    } else if (!_emailRegExp.hasMatch(value)) {
      return 'Email farmati noto`g`ri';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please password kiriting';
    } else if (!_passwordRegExp.hasMatch(value)) {
      return 'Faqat raqam kiritilsin';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Full nameni to`liq yozing';
    }
    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }
}
