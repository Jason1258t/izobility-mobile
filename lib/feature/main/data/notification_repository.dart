import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';

class NotificationsRepository {
  final ApiService apiService;
  final PreferencesService preferences;

  NotificationsRepository({required this.apiService, required this.preferences});

  Future<dynamic> loadNotificationList(int page) {
    throw UnimplementedError();
  }
}
