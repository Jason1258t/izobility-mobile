import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:meta/meta.dart';

part 'coins_on_chain_state.dart';

class CoinsOnChainCubit extends Cubit<CoinsOnChainState> {
  final WalletRepository walletRepository;

  CoinsOnChainCubit(this.walletRepository) : super(CoinsOnChainInitial());

  void loadCoinsOnChain() async {
    emit(CoinsOnChainLoading());

    try {
      await walletRepository.getOnChainCoinsData();

      emit(CoinsOnChainSuccess());
    } catch (ex) {
      print(ex);
      emit(CoinsOnChainFailure());
    }
  }
}
