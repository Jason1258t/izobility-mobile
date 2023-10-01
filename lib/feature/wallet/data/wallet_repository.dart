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
  int emeraldCoin = 0;
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

  BehaviorSubject<LoadingStateEnum> emeraldCoinStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  Future<void> getUserEmeraldBill() async {
    await apiCripto.getUserEmeraldBill(
      walletModel!
    );
  }

  void loadEmeraldCoin() async {
    emeraldCoinStream.add(LoadingStateEnum.loading);
    try {
      final data = await apiService.wallet.getEmeraldCoin();
      emeraldCoin = data['balance'];

      await getGameTokens();

      emeraldCoinStream.add(LoadingStateEnum.success);
    } catch (e) {
      emeraldCoinStream.add(LoadingStateEnum.fail);
    }
  }

  Future getGameTokens() async {
    final res = await apiService.wallet.getUserGameTokens();
    gameTokens.clear();

    for (var json in res) {
      gameTokens.add(TokenData.fromJson(json));
    }
  }
}
