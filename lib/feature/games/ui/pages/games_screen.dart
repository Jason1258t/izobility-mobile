import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/games/ui/widgets/games_card.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/game.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      color: AppColors.purpleBcg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.purpleBcg,
                surfaceTintColor: Colors.transparent,
                pinned: true,
                floating: false,
                centerTitle: true,
                title: Text(
                  localize.gaming,
                  style: AppTypography.font16w700.copyWith(color: Colors.black),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                    itemBuilder: ((context, index) => GamesCard(
                          game: GameModel(
                              gameId: 0,
                              grade: 4.5,
                              name: "Забивной танец со шпагой 3дэ",
                              imagePath: 'https://memepedia.ru/wp-content/uploads/2021/09/abobus-1.jpg'),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
