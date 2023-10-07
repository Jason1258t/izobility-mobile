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

  Future<dynamic> getUserDetailsInfo({required int userId}) async {
    final response = await dio.get(
      "${ApiEndpoints.userInfo}${userId}",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${currentToken.accessToken}',
          'Content-Type': "application/json",
        },
      ),
    );
    return response.data;
  }

  Future<dynamic> updateUserData({
    required String name,
    required String surname,
    required int gender,
    required String birthday,
  }) async {
    if (name != "" && surname != "") {
      final responseUpdateName = await post(ApiEndpoints.userUpdateName, data: {
        "fam": surname.toString(),
        "name": name.toString(),
        "otch": "",
      });
    }

    final responseUpdateBirthDay = await post(ApiEndpoints.userUpdateBirthday,
        data: {"date_birth": birthday});

    final responseUpdateGender =
        await post(ApiEndpoints.userUpdateGender, data: {"gender": gender});
  }

  Future<void> validateUserPhone(int userId) async {
    await post(ApiEndpoints.confirmRegister, data: {
      'phone': "9177044054",
      'phone_country': "+7",
      'token': currentToken.accessToken,
      "id": userId,
      'site_id': siteId
    });
  }
}
