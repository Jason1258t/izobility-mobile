part of 'api_service.dart';

class News with ApiHandler {
  News(
      {required Dio dio_,
        required PreferencesService preferences,
        required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }

  Future<List> getNews() async {
    final res = await get(ApiEndpoints.news);

    return res['objects'];
  }
}
