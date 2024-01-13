import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/burse_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:meta/meta.dart';

part 'burse_create_order_state.dart';

class BurseCreateOrderCubit extends Cubit<BurseCreateOrderState> {
  final BurseRepository burseRepository;

  BurseCreateOrderCubit(this.burseRepository)
      : super(BurseCreateOrderInitial());

  void clearState() {
    emit(BurseCreateOrderInitial());
  }

  void createOrder(int amountFrom, int amountTo) async {
    emit(BurseCreateOrderLoading());

    await Future.delayed(Duration(seconds: 1));
    try {
      await burseRepository.createBurseOrder(amountFrom, amountTo);
      emit(BurseCreateOrderSuccess());
    } catch (ex) {
      print(ex);
      emit(BurseCreateOrderFailure());
    }
  }
}
