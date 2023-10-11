import 'package:flutter_dotenv/flutter_dotenv.dart';

class TokenData {
  final String id;
  final String amount;
  final String name;
  final String imageUrl;
  final String rubleExchangeRate;
  final String description;

  TokenData({
    required this.amount,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rubleExchangeRate,
    required this.description,
  });

  TokenData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        amount = double.parse(json['amount'] ?? "0").toStringAsFixed(5),
        rubleExchangeRate =
            double.parse(json['kurs_rub'] ?? "0").toStringAsFixed(5),
        name = json['name'] ?? "0",
        imageUrl = '${dotenv.get('BASE_SERVER_URL')}media/' + json['logo'],
        description = json["description"] ?? '';
}
