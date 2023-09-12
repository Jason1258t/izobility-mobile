import 'package:izobility_mobile/models/login_data.dart';
import 'package:izobility_mobile/models/register_data.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../services/locale/preferences_service.dart';

enum AppStateEnum { wait, auth, unAuth }

enum EmailStateEnum { unregistered, registered }

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  BehaviorSubject<AppStateEnum> appState =
      BehaviorSubject.seeded(AppStateEnum.wait);

  _auth(Future authMethod) async {
    await authMethod;
    appState.add(AppStateEnum.auth); // TODO скорее всего переписать: вытаскивать токен и прочая балда
  }

  Future<EmailStateEnum> checkEmail(String email) async {
    await Future.delayed(Duration(seconds: 1)); // TODO заменить на нормальную проверку через api
    return EmailStateEnum.unregistered;
  }

  Future register(RegisterData data) async {
    _auth(Future.delayed(Duration(seconds: 1)));
  }

  Future login(LoginData data) async {
    _auth(Future.delayed(Duration(seconds: 1)));
  }

  Future logout() async {

  }
}
