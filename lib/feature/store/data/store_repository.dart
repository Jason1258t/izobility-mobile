import 'package:izobility_mobile/models/market_item.dart';
import 'package:izobility_mobile/models/market_preview_item.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/rxdart.dart';

enum CategoryEnum { promos, gifts, products }

class StoreRepository {
  final ApiService apiService;

  MarketItemModel lastOpenedMarketItem = MarketItemModel();

  StoreRepository({required this.apiService});

  CategoryEnum activeCategory = CategoryEnum.products;

  List<MarketPreviewItem> marketItems = [];
  List<dynamic> giftsList = [];
  List<dynamic> promocodeList = [];

  int pageNumber = 1;

  BehaviorSubject<LoadingStateEnum> marketItemsStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  void setActiveCategory(CategoryEnum category) {
    activeCategory = category;
  }

  Future getMarketItems() async {
    marketItemsStream.add(LoadingStateEnum.loading);

    try {
      final res = await apiService.shop.getLimitedItems(10, pageNumber);

      if (pageNumber == 1) {
        marketItems.clear();
      }

      for (int i = 0; i < res.length; i++) {
        marketItems.add(MarketPreviewItem.fromJson(json: res[i]));
      }

      marketItemsStream.add(LoadingStateEnum.success);
    } catch (e) {
      marketItemsStream.add(LoadingStateEnum.fail);
    }
  }

  Future<MarketItemModel?> getMarketItemInfo(int id) async {
    try {
      final response = await apiService.shop.getMarketItemInfoByd(id);
      print(response);
      final MarketItemModel marketItem = MarketItemModel.fromJson(response);

      return marketItem;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  void setPageNumber(int number) {
    pageNumber = number;

    getMarketItems();
  }
}
