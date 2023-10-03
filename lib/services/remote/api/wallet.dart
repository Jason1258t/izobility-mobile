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

  Future<void> transferCoinToOnChain(int coinId, double amount) async {
    await post(ApiEndpoints.walletTransferEmeraldToOnChain, data: {
      'moneta_id': coinId,
      'amount': amount
    });
  }
}
