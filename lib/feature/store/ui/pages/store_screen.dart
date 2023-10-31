import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/store/bloc/store_cubit.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/container_with_text.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/containers/market_Item.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    final storeRepository = context.read<StoreRepository>();

    scrollController.addListener(() async {
      if (scrollController.position.atEdge) {
        double maxScroll = scrollController.position.maxScrollExtent;
        double currentScroll = scrollController.position.pixels;

        if (currentScroll >= maxScroll * 0.8) {
          storeRepository.setPageNumber(storeRepository.pageNumber + 1);
          storeRepository.getMarketItems();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final storyRepository = RepositoryProvider.of<StoreRepository>(context);

    final localize = AppLocalizations.of(context)!;

    String getStringCategoryByEnum(CategoryEnum categoryEnum) {
      switch (categoryEnum) {
        case CategoryEnum.products:
          return localize.product_and_nft;
        case CategoryEnum.promos:
          return localize.promo_codes;
        case CategoryEnum.gifts:
          return localize.gifts;
      }
    }

    return HomeScaffold(
      appBar: CustomAppBar(
        text: localize.shop,
        context: context,
        isBack: false,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () {
          storyRepository.setPageNumber(1);

          return storyRepository.getMarketItems();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<StoreCubit, StoreState>(
            builder: (context, state) {
              var shopItems = storyRepository.marketItems;
              bool isLoading = state is StoreLoading;

              return CustomScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ContainerWithText(
                                  title: localize.promo_codes,
                                  path: 'category',
                                  width: (sizeOf.width - 47) / 2,
                                  onTap: () {
                                    setState(() {
                                      storyRepository.setActiveCategory(
                                          CategoryEnum.promos);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                ContainerWithText(
                                  title: localize.gifts,
                                  path: 'gift',
                                  width: (sizeOf.width - 47) / 2,
                                  onTap: () {
                                    setState(() {
                                      storyRepository.setActiveCategory(
                                          CategoryEnum.gifts);
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ContainerWithText(
                              title: localize.product_and_nft,
                              path: 'card',
                              width: sizeOf.width - 36,
                              onTap: () {
                                setState(() {
                                  storyRepository
                                      .setActiveCategory(CategoryEnum.products);
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              getStringCategoryByEnum(
                                  storyRepository.activeCategory),
                              style: AppTypography.font24w700
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => MarketItem(
                            coinData: shopItems[index].coins,
                            textDescription: shopItems[index].name,
                            imageUrl: shopItems[index].imageUrl,
                            onTap: () {
                              context.push(
                                  "/store/${storyRepository.marketItems[index].id}");
                            },
                            isNew: shopItems[index].isNew,
                            pizdulkaUrl: '',
                          ),
                          childCount: shopItems.length,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 8,
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width / 2,
                            childAspectRatio: 160 / 240)),
                    isLoading
                        ? const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : SliverToBoxAdapter(
                            child: Container(),
                          )
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
