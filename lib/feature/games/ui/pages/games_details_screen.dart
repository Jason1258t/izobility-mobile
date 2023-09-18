import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/games/data/games_repository.dart';
import 'package:izobility_mobile/feature/games/ui/widgets/games_details_stats_card.dart';
import 'package:izobility_mobile/feature/games/ui/widgets/games_screenshot_card.dart';

import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';

class GamesDetailsScreen extends StatefulWidget {
  final String gameId;

  const GamesDetailsScreen({super.key, required this.gameId});

  @override
  State<GamesDetailsScreen> createState() => GamesDetailsScreenState();
}

class GamesDetailsScreenState extends State<GamesDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final game = context.read<GamesRepository>().lastLoadedGameDetials;

    return Container(
      color: AppColors.purpleBcg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.purpleBcg,
                surfaceTintColor: Colors.transparent,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 9,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(game.imagePath),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: Text(
                            game.name,
                            style: AppFonts.font16w400
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          game.companyName,
                          style: AppFonts.font12w400
                              .copyWith(color: AppColors.grey500),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GamesDetialsStatsCard(
                          label: "${game.grade}",
                          description: "${game.gradesQuantity} оценок"),
                      GamesDetialsStatsCard(
                          label: "${game.downloadsQuantity}",
                          description: "Скачиваний"),
                      GamesDetialsStatsCard(
                          label: "${game.weight} MB", description: "Размер")
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    width: double.infinity,
                    onTap: () {},
                    text: "Скачать",
                    radius: 100,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 256,
                    child: Row(
                      children: [
                        ...List.generate(game.screenshotList.length * 2,
                            (index) {
                          if (index % 2 == 1) {
                            return GamesScreenshotCard(
                              imagePath: game.screenshotList[index ~/ 2],
                            );
                          } else {
                            return const SizedBox(
                              width: 16,
                            );
                          }
                        }),
                        const SizedBox(
                          width: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Описание",
                        style:
                            AppFonts.font18w700.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        game.description,
                        style:
                            AppFonts.font12w400.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
