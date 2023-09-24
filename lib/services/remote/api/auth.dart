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

  Future<dynamic> registerUser() async {
    return await post("/user/registration", queryParameters: {
      "phone": "",
      "phone_country": "+7",
      "email": "dgerasimov2006@gmail.com",
      "promo": "",
      "site_id": 0
    });
  }

  Future<dynamic> confirmRegistration(
      {required String confirmCode, required String userId}) async {
    final response = post(ApiMethodsUrl.confirmRegister,
        data: {"token": confirmCode, "id": userId});

    return response;
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    final user = post(ApiMethodsUrl.login, data: {
      "login": "",
      "phone_country": "+7", // DEFAULT VALUE FOR TESTS.
      "email": email,
      "password": password,
      "site_id": 0
    });

    return user;
  }
}
