import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/store/bloc/store_cubit.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
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
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final storyRepository = RepositoryProvider.of<StoreRepository>(context);

    return HomeScaffold(
      appBar: CustomAppBar(
        text: 'Магазин',
        context: context,
        isBack: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(slivers: [
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
                        title: 'Промокоды',
                        path: 'category',
                        width: (sizeOf.width - 50) / 2,
                        onTap: () {
                          setState(() {
                            storyRepository.setActiveCategory("Промокоды");
                          });
                        },
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      ContainerWithText(
                        title: 'Подарки',
                        path: 'gift',
                        width: (sizeOf.width - 50) / 2,
                        onTap: () {
                          setState(() {
                            storyRepository.setActiveCategory("Подарки");
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ContainerWithText(
                    title: 'Товары и NFT',
                    path: 'card',
                    width: sizeOf.width - 36,
                    onTap: () {
                      setState(() {
                        storyRepository.setActiveCategory("Товары и NFT");
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    storyRepository.activeCategory,
                    style:
                        AppTypography.font24w700.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<StoreCubit, StoreState>(
            builder: (context, state) {
              if (state is StoreSuccess) {
                return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => MarketItem(
                        coinData: storyRepository.marketItems[index].coins,
                        textDescription:
                            storyRepository.marketItems[index].name,
                        imageUrl: storyRepository.marketItems[index].imageUrl,
                        onTap: () {
                          context.push("/store/${storyRepository.marketItems[index].id}");
                        },
                        isNew: storyRepository.marketItems[index].isNew,
                        pizdulkaUrl: '',
                      ),
                      childCount: storyRepository.marketItems.length,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 8,
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width / 2,
                        childAspectRatio: 160 / 229));
              } else if (state is StoreLoading) {
                return const SliverToBoxAdapter(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: Text('проблемс с беком'),
              );
            },
          )
        ]),
      ),
    );
  }
}

class ContainerWithText extends StatelessWidget {
  const ContainerWithText(
      {super.key,
      required this.title,
      required this.path,
      required this.width,
      this.onTap});

  final String title;
  final String path;
  final double width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        width: width,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.03),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/$path.svg',
              width: 25,
              height: 25,
              color: Colors.black,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: AppTypography.font18w700.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
