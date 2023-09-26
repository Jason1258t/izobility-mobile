import 'package:izobility_mobile/services/remote/api/api_service.dart';

enum StateWalletPage { wallet, gaming }

class WalletRepository {
  final ApiService apiService;

  WalletRepository(this.apiService);

  bool obscured = false;
  int emeraldCoin = 0;
  int walletPage = 0;

  void setObscured(bool f) {
    obscured = f;
  }

  void setWalletPage(int page){
    walletPage = page;
  }

  void loadEmeraldCoin() async{
    final data = await apiService.wallet.getEmeraldCoin();

    emeraldCoin = data['balance'];
  }
}
