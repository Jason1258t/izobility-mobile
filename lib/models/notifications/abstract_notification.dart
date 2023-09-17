import '../../utils/logic/enums.dart';

abstract class AbstractNotificationModel {
  final NotificationTransactionTypeEnum type;

  final DateTime time;

  final String name;

  AbstractNotificationModel({required this.type, required this.time, required this.name});


}
