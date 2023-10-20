import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/games/ui/widgets/games_card.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/game.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';

import '../../../profile/data/user_repository.dart';
import '../../../wallet/data/wallet_repository.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    loadAndroidUnity() async {
      const String _channel = 'unity_activity';
      const platform = MethodChannel(_channel);

      final balances =
          RepositoryProvider.of<WalletRepository>(context).getUnityBalances();

      final user = RepositoryProvider.of<UserRepository>(context).getUserJson();

      try {
        try {
          Future.wait([balances, user]).then((value) async {
            final clientData = {}
              ..addAll(value[0])
              ..addAll(value[1]);

            print('{');
            clientData.forEach((key, value) {
              print('      $key: $value,');
            });
            print('}');

            final data = await platform.invokeMethod(
              'startUnity',
              {'user': jsonEncode(clientData)},
            );
            print('HERE 2');
            print('DATA $data');
          });
        } catch (e) {
          rethrow;
        }
      } on PlatformException catch (e) {
        rethrow;
      }
    }

    return Container(
      color: AppColors.purpleBcg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 200),
                  sliver: SliverToBoxAdapter(
                    child: CustomButton(
                        text: 'Перейти в unity',
                        onTap: loadAndroidUnity,
                        width: double.infinity),
                  )
                  //SliverList.separated(
                  //                     itemCount: 10,
                  //                     separatorBuilder: (context, index) => const SizedBox(
                  //                           height: 16,
                  //                         ),
                  //                     itemBuilder: ((context, index) => GamesCard(
                  //                           game: GameModel(
                  //                               gameId: 0,
                  //                               grade: 4.5,
                  //                               name: "Забивной танец со шпагой 3дэ",
                  //                               imagePath: 'https://memepedia.ru/wp-content/uploads/2021/09/abobus-1.jpg'),
                  //                         ))),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
