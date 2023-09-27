import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/market_preview_item.dart';
import '../../../models/story.dart';
import '../../../services/remote/api/api_service.dart';

// storiesList = [
//   Story(
//       title: 'Как жеско обыграть казино',
//       subtitle:
//           'План такой: учим теорию вероятности говно вопрос минут на 15, потом корешимся с чеченцами...',
//       imageUrl:
//           'https://img3.akspic.ru/crops/6/4/2/8/6/168246/168246-skazhi_igru-lyudo_king-kosti-igra_v_kosti-azartnaya_igra-1407x3045.jpg',
//       previewUrl:
//           'https://kartinkof.club/uploads/posts/2022-04/1649632556_1-kartinkof-club-p-ugarnie-kartinki-dlya-avi-stim-1.jpg',
//       duration: const Duration(seconds: 10),
//       index: 0,
//       id: '0'),
//   Story(
//       title: 'Чекайте кота',
//       subtitle: 'Не ну кто скажет что кот херня. Ну имба ж нет?',
//       imageUrl:
//           'https://neyrosety.ru/wp-content/uploads/2023/03/00505-1011766434-576x1024.jpg',
//       previewUrl:
//           'https://www.perunica.ru/uploads/posts/2019-03/1552932077_1.jpg',
//       buttonUrl: 'https://ru.pinterest.com/pin/610941505684151390/',
//       duration: const Duration(seconds: 10),
//       index: 1,
//       id: '1')
// ];

// marketItems = List.generate(4, (index) => MarketPreviewItem.fish());

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
      await getStories();
      await getMarketItems();
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
  Future getMarketItems() async {
    final res = await apiService.shop.getLimitedItems();
    marketItems.clear();
    for (int i = 0; i < res.length; i++) {
      marketItems.add(MarketPreviewItem.fromJson(json: res[i]));
    }
  }
}
