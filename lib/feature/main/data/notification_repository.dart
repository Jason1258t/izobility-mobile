import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';

class NotificationsRepository {
  final ApiService apiService;
  final PreferencesService preferences;

  final List<String> filterCategories = [
    'Все',
    'Покупка',
    'Продажа',
    'Акция',
  ];

  int currentFilterIndex = 0;

  List<dynamic> rawNotificationList = [];

  List<dynamic> sortedNotificationList = [];

  NotificationsRepository(
      {required this.apiService, required this.preferences});

  Future<dynamic> loadNotificationList() async {
    // final rawNotifications = await apiService.notifications.loadNotifications();

    // rawNotificationList = notificationResponse;
  }
}
