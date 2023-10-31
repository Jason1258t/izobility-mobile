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

  BehaviorSubject<LoadingStateEnum> marketItemsStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  void setActiveCategory(CategoryEnum category) {
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
    } catch (e) {
      marketItemsStream.add(LoadingStateEnum.fail);
    }
  }

  Future<MarketItemModel?> getMarketItemInfo(int id) async {
    try {
      final response = await apiService.shop.getMarketItemInfo(id);
      print(response);
      final MarketItemModel marketItem = MarketItemModel.fromJson(response);

      return marketItem;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<dynamic> buyProduct(int productId) async {
    final response = await apiService.shop.buyProduct(productId);
  }

  Future<dynamic> getUserProductList() async {
    final response = await apiService.shop.getUserProductList();
  }

  Future<dynamic> sendRequestForRecievingByMail() async {
    final response = await apiService.shop.sendRequestForRecievingByMail();
  }
}
