import 'package:flutter_dotenv/flutter_dotenv.dart';

class TokenData {
  final String amount;
  final String name;
  final String imageUrl;
  final String rubleExchangeRate;

  TokenData(
      {required this.amount,
      required this.name,
      required this.imageUrl,
      required this.rubleExchangeRate});

  TokenData.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        rubleExchangeRate = json['kurs_rub'],
        name = json['name'],
        imageUrl = '${dotenv.get('BASE_SERVER_URL')}media/' + json['logo'] {
    print(imageUrl);
  }
}
