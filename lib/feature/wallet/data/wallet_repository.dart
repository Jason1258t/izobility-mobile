import 'package:izobility_mobile/services/remote/api/api_service.dart';

class WalletRepository {
  final ApiService apiService;

  WalletRepository(this.apiService);

  bool obscured = false;
  int emeraldCoin = 0;

  void setObscured(bool f) {
    obscured = f;
  }

  void loadEmeraldCoin() async{
    final data = await apiService.wallet.getEmeraldCoin();

    emeraldCoin = data['balance'];
  }
}
