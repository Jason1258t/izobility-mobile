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

  Future activatePromoCode(String code) =>
      post(ApiEndpoints.usePromoCode, data: {'code': code});

  Future<List> getLimitedItems(int pageSize, int pageNumber) async {
    final res = await get(ApiEndpoints.productsList, queryParameters: {
      'site_id': siteId,
      "page_size": pageSize,
      "page": pageNumber,
    });

    return res['objects'];
  }

  Future<dynamic> getMarketItemInfoByd(int id) async {
    final response = await post("${ApiEndpoints.productItemInfo}$id");
    return response;
  }
}
