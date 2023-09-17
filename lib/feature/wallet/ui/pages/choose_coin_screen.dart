import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/choose_coin_card.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ChooseCoinScreen extends StatefulWidget {
  const ChooseCoinScreen({super.key, required this.path});

  final String path;

  @override
  State<ChooseCoinScreen> createState() => _ChooseCoinScreenState();
}

class _ChooseCoinScreenState extends State<ChooseCoinScreen> {
  @override
  Widget build(BuildContext context) {
    final walletRepository = context.read<WalletRepository>();

    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Coin",
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.purpleBcg,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 16,
            ),
            Column(
              children: List.generate(
                  20,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ChooseCoinCard(
                        onTap: () {
                          if(widget.path != AppStrings.nullText){
                            context.push('/wallet/${widget.path}');
                          }
                          else{
                            context.pop();
                          }
                        },
                        amount: walletRepository.obscured ? AppStrings.obscuredText : '0,21',
                        name: "index",
                        coinPath: 'assets/icons/coin.svg'),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
