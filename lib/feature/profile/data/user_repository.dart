import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';

class UserRepository {
  final ApiService apiService;
  final PreferencesService preferences;
  late UserModel user;

  UserRepository({required this.apiService, required this.preferences});

  Future<UserModel?> getUserInfo() async {
    final user = preferences.getUser();
    return user;
  }
}
