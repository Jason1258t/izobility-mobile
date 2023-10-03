part of 'api_service.dart';

class Wallet with ApiHandler {
  Wallet(
      {required Dio dio_,
      required PreferencesService preferences,
      required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }

  Future getUserGameTokens() async {
    final res = await get(ApiEndpoints.userGameTokens);
    return res['objects'];
  }

  Future<dynamic> getEmeraldCoin() async {
    return await get(ApiEndpoints.wallet);
  }

  Future<void> walletFunc1() async {
    print(await post("/wallet/list", data: {
      // 'moneta_id': 21,
      // 'amount': 1,
      'site_id': 2,
    }));
  }
}
