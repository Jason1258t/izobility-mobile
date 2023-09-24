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
}
