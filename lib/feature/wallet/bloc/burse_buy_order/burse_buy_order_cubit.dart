import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/burse_repository.dart';
import 'package:meta/meta.dart';

part 'burse_buy_order_state.dart';

class BurseBuyOrderCubit extends Cubit<BurseBuyOrderState> {
  final BurseRepository burseRepository;

  BurseBuyOrderCubit(this.burseRepository) : super(BurseBuyOrderInitial());

  void buyOrder(int orderId) async {
    emit(BurseBuyOrderLoading());

    try {
      await burseRepository.buyBurseOrder(orderId);

      emit(BurseBuyOrderSuccess());
    } catch (ex) {
      emit(BurseBuyOrderFailure());
    }
  }

  void cancelOrder(int orderId) async {
    emit(BurseBuyOrderLoading());

    try {
      await burseRepository.canselBurseOrder(orderId);

      emit(BurseBuyOrderSuccess());
    } catch (ex) {
      emit(BurseBuyOrderFailure());
    }
  }
}
