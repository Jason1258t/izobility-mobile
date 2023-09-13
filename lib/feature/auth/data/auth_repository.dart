import 'package:izobility_mobile/models/login_data.dart';
import 'package:izobility_mobile/models/register_data.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../services/locale/preferences_service.dart';

enum AppStateEnum { wait, auth, unAuth }

enum EmailStateEnum { unregistered, registered }

class AuthRepository {
  final ApiService apiService;
  final PreferencesService preferences;

  AuthRepository({
    required this.apiService,
    required this.preferences,
  });

  BehaviorSubject<AppStateEnum> appState =
      BehaviorSubject.seeded(AppStateEnum.wait);

  Future _auth(Future authMethod) async {
    await authMethod;
    appState.add(AppStateEnum
        .auth); // TODO скорее всего переписать: вытаскивать токен и прочая балда
  }

  Future<EmailStateEnum> checkEmail(String email) async {
    await Future.delayed(
        const Duration(seconds: 1)); // TODO заменить на нормальную проверку через api
    return EmailStateEnum.registered;
  }

  Future register(RegisterData data) async {
    await _auth(Future.delayed(const Duration(seconds: 2)));
  }

  Future login(LoginData data) async {
    await _auth(Future.delayed(const Duration(seconds: 2)));
  }

  Future checkLogin() async {
    await Future.delayed(Duration(milliseconds: 500));
    appState.add(AppStateEnum.unAuth);
  }

  Future<void> setEnterPin(String pin) async => await preferences.setPin(pin);

  Future<String?> getPin() async => await preferences.getPin();

  Future logout() async {}
}
