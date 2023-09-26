import 'package:izobility_mobile/models/notifications/notification_coin_model.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
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
    '123',
    '312',
    'sdfsdf',
  ];

  int currentFilterIndex = 0;

  List<dynamic> rawNotificationList = [];

  List<dynamic> sortedNotificationList = [];

  NotificationsRepository(
      {required this.apiService, required this.preferences});

  Future<dynamic> loadNotificationList() async {
    // final rawNotifications = await apiService.notifications.loadNotifications();

    rawNotificationList = notificationResponse;
  }
}

final notificationResponse = [
  NotificationCoinModel(
      type: NotificationTransactionTypeEnum.get,
      time: DateTime.now(),
      name: "АНАЛЬНАЯ ЗАРУБА",
      count: 5200,
      coinImagePath: 'assets/icons/coin.svg'),
  NotificationModel(
      type: NotificationTransactionTypeEnum.get,
      time: DateTime.now(),
      name: "бой с теньи",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the iscrambled"),
  NotificationCoinModel(
      type: NotificationTransactionTypeEnum.get,
      time: DateTime.now(),
      name: "РАСКОЛБАС",
      count: 5200,
      coinImagePath: 'assets/icons/coin.svg'),
  NotificationModel(
      type: NotificationTransactionTypeEnum.get,
      time: DateTime.now(),
      name: "ангри беурдс",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin"),
  NotificationModel(
      type: NotificationTransactionTypeEnum.get,
      time: DateTime.now(),
      name: "ангри беурдс",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin"),
];
