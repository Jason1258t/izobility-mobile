class BurseOrderModel {
  String amountSend;
  String amountGet;
  String id;
  String monetIdSend;
  String monetIdGet;
  DateTime createdAt;

  BurseOrderModel({
    required this.amountSend,
    required this.amountGet,
    required this.id,
    required this.createdAt,
    required this.monetIdGet,
    required this.monetIdSend
  });

  factory BurseOrderModel.fromJson(Map<String, dynamic> json) {
    return BurseOrderModel(
      amountSend: json['from'] ?? "",
      amountGet: json['amount_to'] ?? "",
      createdAt: json['created_at'] ?? "",
      id: json['id'] ?? "",
      monetIdSend: json['monet_from'] ?? "",
      monetIdGet: json['monet_to'] ?? "",
    );
  }
}
