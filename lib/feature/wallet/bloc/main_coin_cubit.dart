import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:meta/meta.dart';

part 'main_coin_state.dart';

class MainCoinCubit extends Cubit<MainCoinState> {
  final WalletRepository walletRepository;

  MainCoinCubit({required this.walletRepository}) : super(MainCoinInitial());

  Future<void> loadEmeraldCoin() async {
    emit(MainCoinLoading());
    try {
      walletRepository.loadEmeraldCoin();

      emit(MainCoinSuccess());
    } catch (e) {
      emit(MainCoinFail());
    }
  }
}
