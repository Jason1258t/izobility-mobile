class NotificationData {
  final int id;
  final int userId;
  final String dateCreate;
  final String header;
  final String message;
  final int type;
  final int isReaded;
  final String time;

  NotificationData({
    required this.id,
    required this.userId,
    required this.dateCreate,
    required this.header,
    required this.message,
    required this.type,
    required this.isReaded,
    required this.time,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      dateCreate: json['date_create'] as String,
      header: json['header'] as String,
      message: json['message'] as String,
      type: json['type'] as int,
      isReaded: json['is_readed'] as int,
      time: json['time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'date_create': dateCreate,
      'header': header,
      'message': message,
      'type': type,
      'is_readed': isReaded,
      'time': time,
    };
  }

  @override
  String toString() {
    return 'NotificationData(id: $id, userId: $userId, dateCreate: $dateCreate, header: $header, message: $message, type: $type, isReaded: $isReaded, time: $time)';
  }
}
