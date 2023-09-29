import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:meta/meta.dart';

part 'promo_code_state.dart';

class PromoCodeCubit extends Cubit<PromoCodeState> {
  final ApiService apiService;

  PromoCodeCubit({required this.apiService}) : super(PromoCodeInitial());

  void activateCode(String code) async {
    emit(PromoActivateProcessState());
    try {
      await apiService.shop.activatePromoCode(code);

      emit(PromoActivatedState());
    } catch (e) {
      emit(PromoInvalidState());
      rethrow;
    }
  }
}
