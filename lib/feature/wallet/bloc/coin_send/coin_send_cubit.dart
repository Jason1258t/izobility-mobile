import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:meta/meta.dart';

part 'coin_send_state.dart';

class CoinSendCubit extends Cubit<CoinSendState> {
  final WalletRepository walletRepository;

  CoinSendCubit({required this.walletRepository}) : super(CoinSendInitial());

  Future<void> sendCoinOnChain(String address, double amount) async {
    emit(CoinSendLoading());

    try {
      if (walletRepository.walletPage == 0) {
        await walletRepository.sendCoinOnChain(address, amount);
      } else if (walletRepository.walletPage == 1) {
        await walletRepository.sendCoinInGame();
      }
      emit(CoinSendSuccess());
    } catch (ex) {
      print('-' * 10);
      print(ex);
      emit(CoinSendFailure());
    }
  }

  Future<void> changeTransferType() async {
    final currentType = walletRepository.transferType;
    if (currentType == TransferTypes.inGame) {
      walletRepository.transferType = TransferTypes.onChain;
    } else {
      walletRepository.transferType = TransferTypes.inGame;
    }
  }

  Future<void> transferCoinGameChain(int coinId, double amount) async {
    emit(CoinSendLoading());

    try {
      if (walletRepository.transferType == TransferTypes.inGame) {
        await walletRepository.swapCoinInGameToOnChain(coinId, amount);
      } else {
        await walletRepository.swapCoinOnChainToInGame(coinId, amount);
      }
      emit(CoinSendSuccess());
    } catch (ex) {
      print(ex);
      emit(CoinSendFailure());
    }
  }
}
