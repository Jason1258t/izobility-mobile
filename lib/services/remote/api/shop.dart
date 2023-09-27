part of 'api_service.dart';

class Shop with ApiHandler {
  Shop(
      {required Dio dio_,
        required PreferencesService preferences,
        required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }

  Future<List> getLimitedItems() async {
    final res = await get(ApiEndpoints.productsList);

    return res['objects'];
  }
}
