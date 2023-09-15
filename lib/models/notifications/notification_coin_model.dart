import 'package:izobility_mobile/models/notifications/abstract_notification.dart';
import 'package:izobility_mobile/utils/enum/notification_category.dart';

class NotificationCoinModel extends AbstractNotificationModel {
  final double count;

  final String coinImagePath;

  NotificationCoinModel(
      {required super.type,
      required super.time,
      required super.name,
      required this.count,
      required this.coinImagePath});

  factory NotificationCoinModel.fromJson(Map<String, dynamic> json) {
    return NotificationCoinModel(
        type: json['--11-'],
        time: json['-66--'],
        name: json['123'],
        count: json['count'],
        coinImagePath: json['count_path']);
  }
}
