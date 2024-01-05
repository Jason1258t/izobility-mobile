import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coins_on_chain/coins_on_chain_cubit.dart';
class OnChainTokens extends StatelessWidget {
  const OnChainTokens({super.key, required this.tokens});

  final List<Widget> tokens;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        BlocBuilder<CoinsOnChainCubit, CoinsOnChainState>(
          buildWhen: (previous, current) {
            return current is CoinsOnChainSuccess ||
                previous is CoinsOnChainInitial;
          },
          builder: (context, state) {
            if (state is CoinsOnChainSuccess) {
              return Column(children: tokens);
            } else if (state is CoinsOnChainLoading) {
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
