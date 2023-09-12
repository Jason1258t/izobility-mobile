part of 'api_service.dart';

class Auth with ApiHandler {
  Auth({required Dio dio_, required PreferencesService preferences}) {
    preferencesService = preferences;
    dio = dio_;
  }
}
