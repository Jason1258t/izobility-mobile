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

  Future<dynamic> getBurseItemList(
      BurseOrderType type, int itemsQuantity, int pageNumber) async {
    final response = await post(ApiEndpoints.burseOrdersList, queryParameters: {
      "isMy": type == BurseOrderType.my,
      "page_size": itemsQuantity,
      "page": pageNumber
    });
    return response;
  }

  Future<void> createBurseOrder(double amountFrom, double amountTo,
      int monetIdFrom, int monetIdTo) async {
    final response = await post(ApiEndpoints.burseCreateOrder, data: {
      "amount_from": amountFrom,
      "amount_to": amountTo,
      "monet_from": monetIdFrom,
      "monet_to": monetIdTo
    });
  }

  Future<void> buyBurseOrder(int orderId) async {
    final response =
        await post(ApiEndpoints.burseBuyOrder, data: {"id": orderId});
  }

  Future<void> canselBurseOrder(int orderId) async {
    final response =
        await post(ApiEndpoints.burseCancelOrder, data: {"id": orderId});
  }
}
