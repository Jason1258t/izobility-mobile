import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/choose_coin_card.dart';
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
                          if(widget.path != 'null'){
                            context.push('/wallet/${widget.path}');
                          }
                          else{
                            context.pop();
                          }
                        },
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
