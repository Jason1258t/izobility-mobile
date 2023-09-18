import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthRepository authRepository;

  AppCubit({required this.authRepository}) : super(AppInitial()) {
    authRepository.appState.stream.listen((event) async {
      if (event == AppStateEnum.unAuth) emit(AppUnAuthState());
      if (event == AppStateEnum.auth) {
        final String? pin = await authRepository.getPin();

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
}
