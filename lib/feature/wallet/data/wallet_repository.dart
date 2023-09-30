import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletRepository {
  final ApiService apiService;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  WalletRepository(this.apiService);

  bool obscured = false;
  int emeraldCoin = 0;
  int walletPage = 1;

  Future<bool> get auth async =>
      (await prefs).getBool('wallet_auth') ?? false;

  Future<void> setWalletAuth(bool f)async{
    (await prefs).setBool('wallet_auth', f);
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
