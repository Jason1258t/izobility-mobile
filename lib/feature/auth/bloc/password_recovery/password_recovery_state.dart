part of 'password_recovery_cubit.dart';

abstract class PasswordRecoveryState {}

class PasswordRecoveryInitial extends PasswordRecoveryState {}


class PasswordRecoveryEmailSent extends PasswordRecoveryState {
  int remainingTime;

  PasswordRecoveryEmailSent({required this.remainingTime});
}

class PasswordRecoveryFailState extends PasswordRecoveryState {}

class PasswordRecoveryProcessState extends PasswordRecoveryState {}

