import 'package:izobility_mobile/utils/constants.dart';

abstract class FieldValidators {
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
}
