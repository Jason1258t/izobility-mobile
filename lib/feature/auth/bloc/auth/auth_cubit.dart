import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/models/register_data.dart';
import 'package:meta/meta.dart';

import '../../data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  RegisterData? registerData;

  void initialRegister(String email) {
    registerData = RegisterData(email: email);
  }

  void checkEmail(String email) async {
    final result = await authRepository.checkEmail(email);

    if (result == EmailStateEnum.registered) {
      emit(LoginState());
    } else {
      initialRegister(email);
      emit(RegisterState());
    }
  }
}
