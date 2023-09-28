import 'package:izobility_mobile/models/market_preview_item.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/rxdart.dart';

class StoreRepository {
  final ApiService apiService;

  StoreRepository({required this.apiService});

  String activeCategory = 'Товары и NFT';
  List<MarketPreviewItem> marketItems = [];

  BehaviorSubject<LoadingStateEnum> marketItemsStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  void setActiveCategory(String category) {
    activeCategory = category;
  }

  Future getMarketItems() async {
    marketItemsStream.add(LoadingStateEnum.loading);

    try {
      final res = await apiService.shop.getLimitedItems();
      marketItems.clear();
      for (int i = 0; i < res.length; i++) {
        marketItems.add(MarketPreviewItem.fromJson(json: res[i]));
      }
      marketItemsStream.add(LoadingStateEnum.success);
    }
    catch(e){
      marketItemsStream.add(LoadingStateEnum.fail);
    }
  }
}
