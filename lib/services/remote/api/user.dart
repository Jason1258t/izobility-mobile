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
    print(name);
    print(surname);
    final responseUpdateName =
        await post(ApiEndpoints.userUpdateName, data: {
      "fam": surname.toString(),
      "name": name.toString(),
      "otch": "12.04.2007",
    });

    final responseUpdateBirthDay = await post(ApiEndpoints.userUpdateBirthday,
        data: {"date_birth": birthday});

    final responseUpdateGender =
        await post(ApiEndpoints.userUpdateGender, data: {"gender": gender});
  }
}
