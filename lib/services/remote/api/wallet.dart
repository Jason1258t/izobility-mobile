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

  Future<void> swapCoinInGameToOnChain(
      int coinId, double amount, HDWallet wallet) async {
    await post(ApiEndpoints.walletSwapInGameToOnChain, data: {
      'moneta_id': coinId,
      'amount': amount,
      'wallet': wallet.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain),
    });
  }

  Future<void> swapCoinOnChainToInGame(
      int coinId, double amount, HDWallet wallet) async {
    await post(ApiEndpoints.walletSwapOnChainToInGame, data: {
      'moneta_id': coinId,
      'amount': amount,
      'wallet': wallet.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain)
    });
  }
}
