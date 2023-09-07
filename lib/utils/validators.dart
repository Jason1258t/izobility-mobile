import 'package:izobility_mobile/utils/constants.dart';

abstract class Validator {
  static emailValidator(value) {
    if (!RegExp(emailRegExp).hasMatch(value!.trim()) && value != "") {
      return 'Неверный email';
    } else {
      return null;
    }
  }

  static validatePassword(value) {
    if (value == null || value == "") {
      return null;
    }

    if (value.length < 6) {
      return 'Слишком короткий';
    }

    return null;
  }

  static checkEquality(String one, String two) {
    return one == two;
  }
}
