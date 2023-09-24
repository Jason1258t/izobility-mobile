part of 'api_service.dart';

class Auth with ApiHandler {
  Auth(
      {required Dio dio_,
      required PreferencesService preferences,
      required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }

  Future<dynamic> registerUser(String email) async {
    final res =  await dio.post(ApiEndpoints.register, data: {
      "phone": "",
      "phone_country": "+7",
      "email": email,
      "promo": "",
      "site_id": 0
    });

    return res;
  }

  Future<dynamic> confirmRegistration(
      {required String confirmCode, required String userId}) async {
    final response = post(ApiEndpoints.confirmRegister,
        data: {"token": confirmCode, "id": userId});

    return response;
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    final response = await dio.post(ApiEndpoints.login, data: {
      "login": "",
      "phone_country": "+7", // DEFAULT VALUE FOR TESTS.
      "email": email,
      "password": password,
      "site_id": 0
    });

    refreshToken(response.data['jwt']);

    return response.data;
  }
}
