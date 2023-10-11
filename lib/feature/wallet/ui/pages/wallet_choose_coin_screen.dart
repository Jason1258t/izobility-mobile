import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/choose_coin_card.dart';
import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';

class ChooseCoinScreen extends StatefulWidget {
  const ChooseCoinScreen({super.key, required this.path, required this.fromOrTo});

  final String path;
  final bool fromOrTo;

  @override
  State<ChooseCoinScreen> createState() => _ChooseCoinScreenState();
}

class _ChooseCoinScreenState extends State<ChooseCoinScreen> {
  @override
  Widget build(BuildContext context) {
    final walletRepository = context.read<WalletRepository>();

    List<TokenData> res = walletRepository.walletPage == 0
        ? walletRepository.coinsInChain
        : walletRepository.coinsInGame;

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: AppColors.purpleBcg,
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
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 16,
              ),
              Column(children: [
                ...List.generate(
                    res.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ChooseCoinCard(
                            onTap: () {
                              if (widget.path != AppStrings.nullText) {
                                context.pushReplacement('/wallet/${widget.path}',
                                    extra: res[index]);
                              } else {
                                context.pop();
                                if(widget.fromOrTo){
                                  walletRepository.setActiveSwapTokenFrom(res[index]);
                                }
                                else{
                                  walletRepository.setActiveSwapTokenTo(res[index]);
                                }
                              }
                            },
                            coin: res[index],
                          ),
                        )),
              ])
            ]),
          ),
        ),
      ),
    );
  }
}