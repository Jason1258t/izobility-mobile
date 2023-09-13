part of 'api_service.dart';

class Auth with ApiHandler {
  Auth({required Dio dio_, required PreferencesService preferences, required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }
}
