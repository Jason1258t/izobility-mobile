import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/models/user_details.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';

class UserRepository {
  final ApiService apiService;
  final PreferencesService preferences;
  UserModel user = UserModel();

  UserRepository({required this.apiService, required this.preferences});

  Future<void> loadUserData() async {
    final cachedUser = await preferences.getUser();
    user = cachedUser ?? user;
  }

  Future<dynamic> loadUserDetailsInfo() async {
    final UserModel? user = await preferences.getUser();
    if (user == null) {
      return null;
    }
    try {
      final response = await apiService.user.getUserDetailsInfo(userId: user.id!);

      final UserDetailsModel userDetails =
          UserDetailsModel.fromJson(response.data);

      user.details = userDetails;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
