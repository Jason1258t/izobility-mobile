import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api/coin_data.dart';

class MarketPreviewItem {
  final String name;
  final String imageUrl;
  final bool isNew;
  final List<CoinPreviewData> coins;
  final String id;

  MarketPreviewItem.fish()
      : name = 'Набор бонусов для игры Reapers rush +156 к мощи',
        imageUrl =
            'https://kartinkin.net/uploads/posts/2022-08/1661214768_6-kartinkin-net-p-burger-king-chiken-barbekyu-vkontakte-11.jpg',
        isNew = true,
        coins = [
          CoinPreviewData(
              imageUrl: 'assets/images/Coins1.png', value: '1567.60')
        ],
        id = 'market';

  MarketPreviewItem.fromJson({required Map<String, dynamic> json})
      : name = json['name'],
        imageUrl = dotenv.get('BASE_SERVER_URL') +
            '/media/' +
            json['images'][0]['path'],
        isNew = true,
        id = json['id'],
        coins = [
          CoinPreviewData(
              imageUrl: "https://api.z-boom.ru/media/" +
                  "moneta/22aca8bb1a77d571aff193a7dcb6d2d1.jpg",
              value: json['price'])
        ];
}
