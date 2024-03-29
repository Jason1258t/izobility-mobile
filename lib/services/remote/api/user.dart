part of 'api_service.dart';

class User with ApiHandler {
  User(
      {required Dio dio_,
      required PreferencesService preferences,
      required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }

  Future<dynamic> getUserDetailsInfo({required int userId}) async =>
      get("${ApiEndpoints.userInfo}$userId");

  Future<dynamic> updateUserData({
    required String name,
    required String surname,
    required int gender,
    required String birthday,
    required String country,
    required String city,
  }) async {
    if (name != "" && surname != "") {
      final responseUpdateName = await post(ApiEndpoints.userUpdateName, data: {
        "fam": surname.toString(),
        "name": name.toString(),
        "otch": ""
      });
    }

    final responseUpdateBirthDay = await post(ApiEndpoints.userUpdateBirthday,
        data: {"date_birth": birthday});

    final responseUpdateGender =
        await post(ApiEndpoints.userUpdateGender, data: {"gender": gender});

    final responseUpdateCountry =
        await post(ApiEndpoints.userUpdateGender, data: {"city": city});

    final responseUpdateCity =
        await post(ApiEndpoints.userUpdateGender, data: {"country": country});
  }

  Future<dynamic> validateUserPhone(
      String countryCode, String phoneNumber, int userId) async {
    final response = await post(ApiEndpoints.userValidatePhone, data: {
      'phone': phoneNumber,
      'phone_country': countryCode,
      'site_id': siteId
    });
    return response;
  }

  Future<void> validatePhoneCode(String code) async {
    await post(ApiEndpoints.userValiddatePhoneCode, data: {"code": code});
  }

  Future<void> updatePhoto(String photoInBase64) async {
    await post(ApiEndpoints.userUpdatePhoto, data: {"image": photoInBase64});
  }

  Future<dynamic> getReferalList() async {
    return get(ApiEndpoints.userReferals);
  }

  Future<dynamic> updateReferalCode(String referal) async {
    return post(ApiEndpoints.userUpdateReferalCode, data: {'promo': referal});
  }
}
