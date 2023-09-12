import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_recovery_state.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryState> {
  PasswordRecoveryCubit() : super(PasswordRecoveryInitial());

  void sendRecoveryEmail(String email) async {
    int repeatDuration = 60;

    emit(PasswordRecoveryProcessState());
    try {
      await Future.delayed(const Duration(seconds: 2)); // TODO заменить на api метод
      emit(PasswordRecoveryEmailSent(remainingTime: repeatDuration));
      _startTimer(repeatDuration);
    } catch (e) {
      emit(PasswordRecoveryFailState());
    }
  }

  void _startTimer(int time) async {
    const Duration duration = Duration(seconds: 1);

    Timer.periodic(duration, (timer) {
      if (time <= 0) {
        emit(PasswordRecoveryInitial());
        timer.cancel();
      } else {
        time--;
        emit(PasswordRecoveryEmailSent(remainingTime: time));
      }
    });
  }
}
