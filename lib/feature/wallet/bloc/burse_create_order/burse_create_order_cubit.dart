import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:meta/meta.dart';

part 'burse_create_order_state.dart';

class BurseCreateOrderCubit extends Cubit<BurseCreateOrderState> {
  final WalletRepository walletRepository;

  BurseCreateOrderCubit(this.walletRepository)
      : super(BurseCreateOrderInitial());

  void clearState() {
    emit(BurseCreateOrderInitial());
  }

  void createOrder() async {
    emit(BurseCreateOrderLoading());

    await Future.delayed(Duration(seconds: 1));
    try {
      emit(BurseCreateOrderSuccess());
    } catch (ex) {
      print(ex);
      emit(BurseCreateOrderFailure());
    }
  }
}
