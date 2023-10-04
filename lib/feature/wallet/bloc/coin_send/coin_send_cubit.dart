import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:meta/meta.dart';

part 'coin_send_state.dart';

class CoinSendCubit extends Cubit<CoinSendState> {
  final WalletRepository walletRepository;

  CoinSendCubit({required this.walletRepository}) : super(CoinSendInitial());

  Future<void> sendCoinOnChain(String address, double amount) async {
    emit(CoinSendLoading());

    await Future.delayed(const Duration(seconds: 1));
    try {
      if (walletRepository.walletPage == 0) {
        await walletRepository.sendCoinOnChain(address, amount);
      } else if (walletRepository.walletPage == 1) {}
      emit(CoinSendSuccess());
    } catch (ex) {
      print('-' * 10);
      print(ex);
      emit(CoinSendFailure());
    }
  }
}
