import 'package:izobility_mobile/bloc_injector.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/market_preview_item.dart';
import '../../../models/story.dart';
import '../../../services/remote/api/api_service.dart';

class MainScreenRepository {
  final ApiService apiService;

  MainScreenRepository({required this.apiService});

  List<MarketPreviewItem> marketItems = [];
  List<Story> storiesList = [];
  String bannerUrl = '';

  BehaviorSubject<LoadingStateEnum> loadingState =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  Future<void> getPreview() async {
    loadingState.add(LoadingStateEnum.loading);
    try {
      await Future.delayed(const Duration(seconds: 1));
      marketItems = List.generate(4, (index) => MarketPreviewItem.fish());

      await getStories();
      loadingState.add(LoadingStateEnum.success);
    } catch (e) {
      loadingState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  Future getStories() async {
    final res = await apiService.news.getNews();
    storiesList.clear();
    for (int i = 0; i < res.length; i++) {
      storiesList.add(Story.fromJson(json: res[i], index: i));
    }
  }
}
