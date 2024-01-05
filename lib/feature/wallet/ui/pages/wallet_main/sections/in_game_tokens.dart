import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coins_in_game/coins_in_game_cubit.dart';

class InGameTokens extends StatelessWidget {
  const InGameTokens({super.key, required this.tokens});

  final List<Widget> tokens;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        BlocBuilder<CoinsInGameCubit, CoinsInGameState>(
          buildWhen: (previous, current) {
            return current is CoinsInGameSuccess ||
                previous is CoinsInGameInitial;
          },
          builder: (context, state) {
            if (state is CoinsInGameSuccess) {
              return Column(children: tokens);
            } else if (state is CoinsInGameLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return Container();
          },
        )
      ]),
    );
  }
}
