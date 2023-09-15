import 'package:izobility_mobile/models/notifications/notification_coin_model.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/enum/notification_category.dart';

final notificationResponse = [
  NotificationCoinModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "АНАЛЬНАЯ ЗАРУБА",
      count: 5200,
      coinImagePath: 'assets/icons/coin.svg'),
  NotificationModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "бой с теньи",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the iscrambled"),
  NotificationCoinModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "РАСКОЛБАС",
      count: 5200,
      coinImagePath: 'assets/icons/coin.svg'),
  NotificationModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "ангри беурдс",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin"),
  NotificationModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "ангри беурдс",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin"),
];



class NotificationsRepository {
  final ApiService apiService;
  final PreferencesService preferences;

  List<dynamic> notificationList = [];

  NotificationsRepository(
      {required this.apiService, required this.preferences});

  Future<dynamic> loadNotificationList(int page) async {
    notificationList = notificationResponse;
  }
}
