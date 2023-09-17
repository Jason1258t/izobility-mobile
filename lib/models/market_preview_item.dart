import 'api/coin_data.dart';

class MarketPreviewItem {
  final String name;
  final String imageUrl;
  final bool isNew;
  final List<CoinData> coins;
  final String id;

  MarketPreviewItem.fish()
      : name = 'Набор бонусов для игры Reapers rush +156 к мощи',
        imageUrl =
            'https://kartinkin.net/uploads/posts/2022-08/1661214768_6-kartinkin-net-p-burger-king-chiken-barbekyu-vkontakte-11.jpg',
        isNew = true,
        coins = [
          CoinData(imageUrl: 'assets/images/Coins1.png', value: '1567.60')
        ],
        id = 'market';
}
