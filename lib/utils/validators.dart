import 'package:izobility_mobile/utils/constants.dart';

abstract class Validator {
  static emailValidator(String? value) {
    if (!RegExp(emailRegExp).hasMatch((value ?? "").trim()) ||
        (value ?? "").isEmpty) {
      return 'Неверный email';
    } else {
      return null;
    }
  }

  static validatePassword(value) {
    if (value.length < 6) {
      return 'Слишком короткий';
    }

    return null;
  }

  static checkEquality(String one, String two) {
    return one == two;
  }

  static nameValidator(String name) {
    if (name.length >= 3) {
      return null;
    } else {
      return 'Длина имени должна быть больше трех';
    }
  }
}
