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
    final response = await get("${ApiEndpoints.userInfo}${userId}");
    return response.data;
  }
}
