import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final ApiService apiService;
  final PreferencesService preferences;
  late User user;

  UserRepository({required this.apiService, required this.preferences});

  Future<User?> getUserInfo() async {
    final user = preferences.getUser();
    return user;
  }
}
