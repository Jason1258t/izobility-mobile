import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/market_preview_item.dart';
import '../../../models/story.dart';

class MainScreenRepository {
  MainScreenRepository() {
    getPreview();
  }

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
      storiesList = [
        Story(
            title: 'Espresso is here!',
            subtitle:
            'Get ready spro bros - its time to brew the espresso you dream about.',
            imageUrl:
            'https://img3.akspic.ru/crops/6/4/2/8/6/168246/168246-skazhi_igru-lyudo_king-kosti-igra_v_kosti-azartnaya_igra-1407x3045.jpg',
            previewUrl:
            'https://kartinkof.club/uploads/posts/2022-04/1649632556_1-kartinkof-club-p-ugarnie-kartinki-dlya-avi-stim-1.jpg',
            duration: const Duration(seconds: 10),
            index: 0,
            id: '0'),
        Story(
            title: 'Абобус is here!',
            subtitle:
            'Get ready spro bros - its time to brew the espresso you dream about.',
            imageUrl:
            'https://neyrosety.ru/wp-content/uploads/2023/03/00505-1011766434-576x1024.jpg',
            previewUrl:
            'https://www.perunica.ru/uploads/posts/2019-03/1552932077_1.jpg',
            buttonUrl: 'https://pub.dev/packages/url_launcher',
            duration: const Duration(seconds: 10),
            index: 1,
            id: '1')
      ];
      loadingState.add(LoadingStateEnum.success);
    } catch (e) {
      loadingState.add(LoadingStateEnum.fail);
    }
  }
}