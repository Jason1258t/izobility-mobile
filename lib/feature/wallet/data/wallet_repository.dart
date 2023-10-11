import 'dart:developer';

import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/models/burse/burse_order.dart';
import 'package:izobility_mobile/services/crypto/api_cripto.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/services/remote/constants/api_constants.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/subjects.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';

class WalletRepository {
  final ApiService apiService;
  final PreferencesService prefs;
  final ApiCripto apiCripto;

  WalletRepository(
      {required this.apiService, required this.prefs, required this.apiCripto});

  bool obscured = false;

  List<TokenData> coinsInGame = [];
  List<TokenData> coinsInChain = [];

  int emeraldInGameBalance = 0;
  double emeraldInWalletBalance = 0;

  int walletPage = 1;
  TransferTypes transferType = TransferTypes.inGame;

  HDWallet? walletModel;

  List<dynamic> ordersGeneralList = [];
  List<dynamic> ordersMyList = [];

  TokenData? activeBurseTo;
  TokenData? activeBurseFrom;

  BehaviorSubject<LoadingStateEnum> emeraldInGameStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  BehaviorSubject<LoadingStateEnum> emeraldInWalletStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  BehaviorSubject<LoadingStateEnum> burseGeneralOrdersStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  BehaviorSubject<LoadingStateEnum> burseMyOrdersStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

// ---------------------------------------

  Future<bool> checkWalletAuth() async {
    final seedPhrase = await prefs.getSeedPhrase();

    return seedPhrase != null;
  }

  Future<void> createWallet() async {
    HDWallet wallet = HDWallet();

    walletModel = wallet;
    print(walletModel);

    await prefs.setSeedPhrase(wallet.mnemonic());
  }

  Future<void> enterWalletBySeedPhrase(String seedPhrase) async {
    HDWallet wallet = HDWallet.createWithMnemonic(seedPhrase);

    walletModel = wallet;
    print(walletModel);

    await prefs.setSeedPhrase(wallet.mnemonic());
  }

  Future<void> clearWallet() async {
    await prefs.clearSeedPhrase();
  }

  Future<void> getWallet() async {
    final seedPhrase = await prefs.getSeedPhrase();

    walletModel = HDWallet.createWithMnemonic(seedPhrase!);
  }

  void setObscured(bool f) {
    obscured = f;
  }

  void setWalletPage(int page) {
    walletPage = page;
  }

  Future<void> getUserEmeraldBill() async {
    emeraldInWalletStream.add(LoadingStateEnum.loading);

    try {
      emeraldInWalletBalance = await apiCripto.getUserCoinBill(
          walletModel!, coinsTransferData['21']!);
      emeraldInWalletStream.add(LoadingStateEnum.success);
    } catch (ex) {
      log(ex.toString());
      emeraldInWalletStream.add(LoadingStateEnum.success);
    }
  }

  Future<void> sendCoinOnChain(
      String address, double amount, int coinId) async {
    final coin = coinsTransferData[coinId.toString()];
    print(coin);
    print(coinId);

    if (coin == null) {
      throw Exception();
    }

    await apiCripto.sendCoinOnChainTo(walletModel!, address, amount, coin);
  }

  Future<void> sendCoinInGame() async {
    // await apiCripto.sendEmeraldTo(walletModel!, address, amount);
  }

  Future<void> swapCoinInGameToOnChain(int coinId, double amount) async {
    await apiService.wallet
        .swapCoinInGameToOnChain(coinId, amount, walletModel!);
  }

  Future<void> swapCoinOnChainToInGame(int coinId, double amount) async {
    final coin = coinsTransferData[coinId];
    late final String transactionCode;

    if (coinId == 32) {
      transactionCode =
          await apiCripto.sendBnb(walletModel!, amount, techWalletAddress);
    } else if (coin == null) {
      throw Exception();
    } else {
      transactionCode = await apiCripto.sendCoinOnChainTo(
          walletModel!, techWalletAddress, amount, coin);
    }

    await apiService.wallet
        .swapCoinOnChainToInGame(coinId, amount, walletModel!, transactionCode);
  }

  void loadEmeraldCoin() async {
    emeraldInGameStream.add(LoadingStateEnum.loading);
    try {
      final data = await apiService.wallet.getEmeraldCoin();

      emeraldInGameBalance = data['balance'];

      getGameTokens();

      emeraldInGameStream.add(LoadingStateEnum.success);
    } catch (e) {
      print(e);
      emeraldInGameStream.add(LoadingStateEnum.fail);
    }
  }

  Future<void> getOnChainCoinsData() async {
    final List<String> coinsIdList = coinsTransferData.keys.toList();

    for (var coinId in coinsIdList) {
      final coin = coinsTransferData[coinId]!;

      final coinBill = await apiCripto.getUserCoinBill(
          walletModel!, coin);

      coinsInChain.add(TokenData(
          amount: coinBill.toString(),
          id: coinId,
          name: coin.name,
          imageUrl: coin.imageUrl,
          rubleExchangeRate: coin.rubleExchangeRate,
          description: coin.description));
    }
  }

  Future getGameTokens() async {
    final res = await apiService.wallet.getUserGameTokens();
    coinsInGame.clear();
    coinsInChain.clear();

    final emeraldCoin = TokenData(
        amount: obscured
            ? "****"
            : walletPage == 0
                ? emeraldInWalletBalance.toString()
                : emeraldInGameBalance.toString(),
        id: "21",
        imageUrl:
            'https://assets.coingecko.com/coins/images/2655/large/emd.png?1644748192',
        name: "Emerald",
        rubleExchangeRate: "0",
        description: '');

    coinsInGame.add(emeraldCoin);

    for (var json in res) {
      try {
        coinsInGame.add(TokenData.fromJson(json));
      } catch (e) {
        print(e);
      }
    }

    activeBurseFrom = coinsInGame[0];
    activeBurseTo = coinsInGame[1];
  }

  Future<dynamic> getBurseGeneralItemList(
      int itemsQuantity, int pageNumber) async {
    ordersGeneralList.clear();

    burseGeneralOrdersStream.add(LoadingStateEnum.loading);

    try {
      final response = await apiService.wallet
          .getBurseItemList(BurseOrderType.general, itemsQuantity, pageNumber);

      final responseItems = response['objects'];

      for (var json in responseItems) {
        try {
          print(json);
          ordersGeneralList.add(BurseOrderModel.fromJson(json));
        } catch (e) {
          print(e);
          continue;
        }
      }

      burseGeneralOrdersStream.add(LoadingStateEnum.success);
    } catch (ex) {
      burseGeneralOrdersStream.add(LoadingStateEnum.fail);
    }
  }

  Future<dynamic> getBurseMyItemList(int itemsQuantity, int pageNumber) async {
    final response = await apiService.wallet
        .getBurseItemList(BurseOrderType.my, itemsQuantity, pageNumber);
    return response;
  }

  Future<void> createBurseOrder(int amountFrom, int amountTo) async {
    await apiService.wallet.createBurseOrder(
        amountFrom, amountTo, activeBurseTo!.id, activeBurseFrom!.id);
  }

  Future<void> buyBurseOrder(int orderId) async {
    await apiService.wallet.buyBurseOrder(orderId);
  }

  Future<void> canselBurseOrder() async {
    await apiService.wallet.canselBurseOrder(1);
  }

  void setActiveBurseFrom(TokenData r) {
    activeBurseFrom = r;
  }

  void setactiveBurseTo(TokenData r) {
    activeBurseTo = r;
  }
}
