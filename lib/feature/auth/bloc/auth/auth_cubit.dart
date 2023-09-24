import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/models/api/token.dart';
import 'package:izobility_mobile/models/login_data.dart';
import 'package:izobility_mobile/models/register_data.dart';
import 'package:izobility_mobile/models/user.dart';

import '../../data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial()) {
    checkLogin();
  }

  RegisterData? registerData;
  LoginData? loginData;

  void checkLogin() => authRepository.checkLogin();

  void _initialRegister(String email) {
    loginData = null;
    registerData = RegisterData(email: email);
  }

  void _initialLogin(String email) {
    registerData = null;
    loginData = LoginData(email: email);
  }

  Future<EmailStateEnum> checkEmail(String email) async {
    final result = await authRepository.checkEmail(email);

    if (result == EmailStateEnum.registered) {
      _initialLogin(email);
      emit(LoginState());
    } else {
      _initialRegister(email);
      emit(RegisterState());
    }

    return result;
  }

  void register() async {
    emit(AuthProcessState());
    try {
      await authRepository.register(registerData!);
      registerData = null;
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthFailState());
    }
  }

  void login() async {
    emit(AuthProcessState());
    // try {
      final responseData = await authRepository.login(loginData!);

      final Token token = Token.fromJson(responseData);
      final UserModel user = UserModel.fromJson(responseData);

      loginData = null;

      authRepository.preferences.setUser(user);
      authRepository.preferences.saveToken(token);

      emit(AuthSuccessState());
    // } catch (e) {
    //   emit(AuthFailState());
    // }
  }
}
