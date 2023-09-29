import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:meta/meta.dart';

part 'promo_code_state.dart';

class PromoCodeCubit extends Cubit<PromoCodeState> {
  final ApiService apiService;
  final WalletRepository walletRepository;

  PromoCodeCubit({required this.apiService, required this.walletRepository}) : super(PromoCodeInitial());

  void activateCode(String code) async {
    emit(PromoActivateProcessState());
    try {
      await apiService.shop.activatePromoCode(code);
      walletRepository.loadEmeraldCoin();
      emit(PromoActivatedState());
    } catch (e) {
      emit(PromoInvalidState());
      rethrow;
    }
  }
}
