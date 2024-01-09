import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/models/burse/burse_order.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/subjects.dart';

class BurseRepository {
  final ApiService apiService;

  BurseRepository({
    required this.apiService,
  });

  TokenData? activeBurseTokenTo;
  TokenData? activeBurseTokenFrom;

  int burseGeneralCurrentPageIndex = 0;
  int burseMyCurrentPageIndex = 0;

  List<dynamic> ordersGeneralList = [];
  List<dynamic> ordersMyList = [];

  BehaviorSubject<LoadingStateEnum> burseGeneralOrdersStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  BehaviorSubject<LoadingStateEnum> burseMyOrdersStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  Future<dynamic> getBurseGeneralItemList(
      int itemsQuantity, int pageNumber) async {
    if (pageNumber == 0) {
      burseGeneralCurrentPageIndex = 0;
      ordersGeneralList.clear();
    }

    burseGeneralOrdersStream.add(LoadingStateEnum.loading);

    try {
      final response = await apiService.wallet
          .getBurseItemList(BurseOrderType.general, itemsQuantity, pageNumber);

      final responseItems = response['objects'];

      for (var json in responseItems) {
        try {
          ordersGeneralList.add(BurseOrderModel.fromJson(json));

          burseGeneralCurrentPageIndex += 1;
        } catch (e) {
          print(e);
          continue;
        }
      }

      burseGeneralOrdersStream.add(LoadingStateEnum.success);
    } catch (ex) {
      burseGeneralOrdersStream.add(LoadingStateEnum.fail);
    }
  }

  Future<dynamic> getBurseMyItemList(int itemsQuantity, int pageNumber) async {
    if (pageNumber == 0) {
      burseMyCurrentPageIndex = 0;
      ordersMyList.clear();
    }
    burseGeneralOrdersStream.add(LoadingStateEnum.loading);

    try {
      final response = await apiService.wallet
          .getBurseItemList(BurseOrderType.my, itemsQuantity, pageNumber);

      for (var json in response['objects']) {
        try {
          ordersMyList.add(BurseOrderModel.fromJson(json));

          burseMyCurrentPageIndex += 1;
        } catch (e) {
          print("cur_ex $e");
          continue;
        }
      }
      print(ordersMyList);

      burseMyOrdersStream.add(LoadingStateEnum.success);
    } catch (ex) {
      print("getBurseMyItemList $ex");
      burseMyOrdersStream.add(LoadingStateEnum.fail);
    }
  }

  Future<void> createBurseOrder(int amountFrom, int amountTo) async {
    await apiService.wallet.createBurseOrder(
        amountFrom, amountTo, activeBurseTokenFrom!.id, activeBurseTokenTo!.id);
  }

  Future<void> buyBurseOrder(int orderId) async {
    await apiService.wallet.buyBurseOrder(orderId);
  }

  Future<void> canselBurseOrder(int orderId) async {
    await apiService.wallet.canselBurseOrder(orderId);
  }

  void setActiveBurseTokenFrom(TokenData tokenData) {
    activeBurseTokenFrom = tokenData;
  }

  void setActiveBurseTokenTo(TokenData tokenData) {
    activeBurseTokenTo = tokenData;
  }

  void loadActiveBurseToken() async{
    final res = await apiService.wallet.getUserGameTokens() as List<dynamic>;

    List<TokenData> coinsInGame = [];

    for (var i = 0; i < 2; i++) {
      try {
        coinsInGame.add(TokenData.fromJson(res[i]));
      } catch (e) {
        print(e);
      }
    }

    activeBurseTokenFrom = coinsInGame[0];
    activeBurseTokenTo = coinsInGame[1];
  }
}
