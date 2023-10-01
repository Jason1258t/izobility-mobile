import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/models/wallet.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_ffi.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';

class WalletRepository {
  final ApiService apiService;
  final PreferencesService prefs;

  WalletRepository({required this.apiService, required this.prefs});

  bool obscured = false;
  int emeraldCoin = 0;
  int walletPage = 1;

  WalletModel? walletModel;

  Future<bool> checkWalletAuth() async {
    final wallet = await prefs.getWallet();

    return wallet != null;
  }

  Future<void> setSeedPhrase(String seedPhrase) async {
    await prefs.setSeedPhrase(seedPhrase);
  }

  Future<void> clearSeedPhrase() async {
    await prefs.clearSeedPhrase();
  }

  Future<void> createWallet() async {
    HDWallet wallet = HDWallet();

    final walletAddress =
        wallet.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain);
    final seedPhrase = wallet.mnemonic();

    final WalletModel walletModel =
        WalletModel(seedPhrase: seedPhrase, address: walletAddress);

    print(walletModel);
    await prefs.setWalletData(walletModel);

    await getWallet();
  }

  Future<WalletModel?> getWallet() async{
    final wallet = await prefs.getWallet();

    walletModel = wallet;
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
