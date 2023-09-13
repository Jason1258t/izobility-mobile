import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final ApiService apiService;
  final PreferencesService preferences;

  UserRepository({required this.apiService, required this.preferences});

  Future<void> getProfileInfo() async {
    throw UnimplementedError();
  }
}
