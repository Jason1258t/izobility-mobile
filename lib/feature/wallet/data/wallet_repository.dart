import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/subjects.dart';

class WalletRepository {
  final ApiService apiService;

  WalletRepository(this.apiService);

  bool obscured = false;
  int emeraldCoin = 0;
  int walletPage = 0;

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
      emeraldCoinStream.add(LoadingStateEnum.success);
    } catch (e) {
      emeraldCoinStream.add(LoadingStateEnum.fail);
    }
  }
}
