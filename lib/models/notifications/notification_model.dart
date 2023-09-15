import 'package:izobility_mobile/models/notifications/abstract_notification.dart';

class NotificationModel extends AbstractNotificationModel {
  final String description;

  NotificationModel(
      {required this.description,
      required super.type,
      required super.time,
      required super.name});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        description: json['-33--'],
        type: json['--11-'],
        time: json['-66--'],
        name: json['123']);
  }
}
