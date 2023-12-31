import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:izobility_mobile/models/login_data.dart';
import 'package:izobility_mobile/models/register_data.dart';
import 'package:izobility_mobile/services/locale/locale_auth.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/user.dart';
import '../../../services/locale/preferences_service.dart';

enum AppStateEnum { wait, auth, unAuth }

enum EmailStateEnum { unregistered, registered }

class AuthRepository {
  final ApiService apiService;
  final PreferencesService preferences;

  // final LocalAuthentication _localAuth = LocalAuthentication();
  final LocaleAuthService localeAuthService;

  int? userId;

  AuthRepository({
    required this.apiService,
    required this.preferences,
    required this.localeAuthService,
  });

  BehaviorSubject<AppStateEnum> appState =
      BehaviorSubject.seeded(AppStateEnum.wait);

  Future<EmailStateEnum> checkEmail(String email, String? promo) async {
    Response response = await apiService.auth.registerUser(email, promo);

    if (response.statusCode == 201) {
      userId = response.data['id'];
      log(userId.toString());
      return EmailStateEnum.unregistered;
    } else {
      return EmailStateEnum.registered;
    }
  }

  Future register(RegisterData data) =>
      _auth(Future.delayed(const Duration(seconds: 2)));

  Future login(LoginData data) async {
    log(userId.toString());
    if (userId != null) {
      await apiService.auth.confirmRegistration(
          confirmCode: data.password!, userId: userId.toString());
    }

    await _auth(
        apiService.auth.login(email: data.email, password: data.password!));
  }

  Future _auth(Future authMethod) async {
    final res = await authMethod;
    final UserModel user = UserModel.fromJson(res['user']);
    await preferences.setUser(user);

    appState.add(AppStateEnum.auth);
  }

  Future changePassword({required String email, required String code}) =>
      apiService.auth.restoreConfirm(email: email, code: code);

  Future checkLogin() async {
    if (await preferences.getUser() != null) {
      appState.add(AppStateEnum.auth);
      return;
    }
    appState.add(AppStateEnum.unAuth);
  }

  // PIN SECTION

  Future localAuthenticate() => localeAuthService.localAuthenticate();

  Future<void> setEnterPin(String pin) async => await preferences.setPin(pin);

  Future<String?> getPin() async => await preferences.getPin();

  // LOGOUT

  Future logout() => apiService.logout();
}
