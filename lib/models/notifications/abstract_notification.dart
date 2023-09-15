import 'package:izobility_mobile/utils/enum/notification_category.dart';

abstract class AbstractNotificationModel {
  final NotificationTransactionType type;

  final DateTime time;

  final String name;

  AbstractNotificationModel({required this.type, required this.time, required this.name});


}
