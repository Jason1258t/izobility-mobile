import 'dart:developer';

import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/services/crypto/api_cripto.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
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

  BehaviorSubject<LoadingStateEnum> emeraldInGameStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  BehaviorSubject<LoadingStateEnum> emeraldInWalletStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  Future<void> getUserEmeraldBill() async {
    emeraldInWalletStream.add(LoadingStateEnum.loading);

    try {
      emeraldInWalletBalance = await apiCripto.getUserEmeraldBill(walletModel!);
      emeraldInWalletStream.add(LoadingStateEnum.success);
    } catch (ex) {
      log(ex.toString());
      emeraldInWalletStream.add(LoadingStateEnum.success);
    }
  }

  Future<void> sendCoinOnChain(String address, double amount) async {
    await apiCripto.sendEmeraldTo(walletModel!, address, amount);
  }

  Future<void> sendCoinInGame() async {
    // await apiCripto.sendEmeraldTo(walletModel!, address, amount);
  }

  Future<void> swapCoinInGameToOnChain(int coinId, double amount) async {
    await apiService.wallet
        .swapCoinInGameToOnChain(coinId, amount, walletModel!);
  }

  Future<void> swapCoinOnChainToInGame(int coinId, double amount) async {
    // final transactionCode = await apiCripto.sendEmeraldTo(walletModel, );

    await apiService.wallet
        .swapCoinOnChainToInGame(coinId, amount, walletModel!);
  }

  void loadEmeraldCoin() async {
    emeraldInGameStream.add(LoadingStateEnum.loading);
    try {
      final data = await apiService.wallet.getEmeraldCoin();
      print(data);

      emeraldInGameBalance = data['balance'];

      await getGameTokens();

      emeraldInGameStream.add(LoadingStateEnum.success);
    } catch (e) {
      print(e);
      emeraldInGameStream.add(LoadingStateEnum.fail);
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
    coinsInChain.add(emeraldCoin);

    for (var json in res) {
      try {
        coinsInGame.add(TokenData.fromJson(json));
      } catch (e) {
        print(e);
      }
    }
  }

  Future<dynamic> getBurseItemList(
      BurseOrderType type, int itemsQuantity, int pageNumber) async {
    final response = await apiService.wallet
        .getBurseItemList(type, itemsQuantity, pageNumber);
    return response;
  }

  Future<void> createBurseOrder() async {
    await apiService.wallet.createBurseOrder(1, 1, 1, 1);
  }

  Future<void> buyBurseOrder() async {
    await apiService.wallet.buyBurseOrder(1);
  }

  Future<void> canselBurseOrder() async {
    await apiService.wallet.canselBurseOrder(1);
  }
}
