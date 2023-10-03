import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/main/data/main_repository.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';

import '../../data/auth_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthRepository authRepository;
  final MainScreenRepository mainRepository;
  final WalletRepository walletRepository;
  final UserRepository userRepository;
  final StoreRepository storeRepository;

  AppCubit(
      {required this.authRepository,
      required this.mainRepository,
      required this.walletRepository,
      required this.userRepository,
      required this.storeRepository})
      : super(AppInitial()) {
    authRepository.appState.stream.listen((event) async {
      if (event == AppStateEnum.unAuth) {
        authRepository.logout();
        emit(AppUnAuthState());
      }
      if (event == AppStateEnum.auth) {
        mainRepository.getPreview();
        final String? pin = await authRepository.getPin();
        walletRepository.loadEmeraldCoin();
        userRepository.loadUserDetailsInfo();
        storeRepository.getMarketItems();

        if (pin == null || pin.length < 4) {
          emit(CreatePinState());
        } else {
          emit(EnterPinState());
        }
      }
    });
  }

  Future<void> createPin(String pin) async {
    await authRepository.setEnterPin(pin);
    emit(AppAuthState());
  }

  Future<bool> checkPin(String pin) async {
    final String? savedPin = await authRepository.getPin();
    if (pin == savedPin) emit(AppAuthState());
    return (pin == savedPin);
  }

  Future authWithBiometric() async {
   final bool auth = await authRepository.localAuthenticate();
   if (auth) emit(AppAuthState());
  }

  bool needRepeatPin = false;

  void pauseApp() async {
    emit(EnterPinState());
  }

  void resumeApp() {
    if (needRepeatPin) {
      emit(EnterPinState());
    }
  }
}
