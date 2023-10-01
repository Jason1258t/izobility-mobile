import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:meta/meta.dart';

part 'coin_send_state.dart';

class CoinSendCubit extends Cubit<CoinSendState> {
  final WalletRepository walletRepository;

  CoinSendCubit({required this.walletRepository}) : super(CoinSendInitial());

  Future<void> sendCoin(String address, int amount) async {
    emit(CoinSendLoading());

    await Future.delayed(Duration(seconds: 1));
    try {
      await walletRepository.sendCoin(address, amount);

      emit(CoinSendSuccess());
    } catch (ex) {
      print('-' * 10);
      print(ex);
      emit(CoinSendFailure());
    }
  }
}
