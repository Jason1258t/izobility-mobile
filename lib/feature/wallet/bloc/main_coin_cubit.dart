import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:meta/meta.dart';

part 'main_coin_state.dart';

class MainCoinCubit extends Cubit<MainCoinState> {
  final WalletRepository walletRepository;

  MainCoinCubit({required this.walletRepository}) : super(MainCoinInitial()) {
    walletRepository.emeraldCoinStream.stream.listen((event) {
      if(event == LoadingStateEnum.loading) emit(MainCoinLoading());
      if(event == LoadingStateEnum.fail) emit(MainCoinFail());
      if(event == LoadingStateEnum.success) emit(MainCoinSuccess());
    });
  }
}
