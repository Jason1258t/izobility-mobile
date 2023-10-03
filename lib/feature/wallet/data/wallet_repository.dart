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
  int emeraldInGameBalance = 0;
  double emeraldInWalletBalance = 0;
  int walletPage = 1;

  HDWallet? walletModel;

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

  List<TokenData> gameTokens = [];

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

  Future<void> sendCoin(String address, double amount) async {
    await apiCripto.sendEmeraldTo(walletModel!, address, amount);
  }

  void loadEmeraldCoin() async {
    emeraldInGameStream.add(LoadingStateEnum.loading);
    try {
      final data = await apiService.wallet.getEmeraldCoin();
      print(data);
      print('-' * 100);

      emeraldInGameBalance = data['balance'];

      await getGameTokens();

      emeraldInGameStream.add(LoadingStateEnum.success);
    } catch (e) {
      print(e);
      print('-' * 100);
      emeraldInGameStream.add(LoadingStateEnum.fail);
    }
  }

  Future getGameTokens() async {
    final res = await apiService.wallet.getUserGameTokens();
    gameTokens.clear();

    for (var json in res) {
      try {
        gameTokens.add(TokenData.fromJson(json));
      }
      catch (e){
        print(e);
      }
    }
  }
}
