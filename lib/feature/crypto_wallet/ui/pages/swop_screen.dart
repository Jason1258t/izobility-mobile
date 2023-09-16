import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/crypto_wallet/ui/widgets/button_choose_coin.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class SwopScreen extends StatefulWidget {
  const SwopScreen({super.key});

  @override
  State<SwopScreen> createState() => _SwopScreenState();
}

class _SwopScreenState extends State<SwopScreen> {
  TextEditingController _enterCoinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Своп",
        isBack: true,
      ),
      body: Container(
        color: AppColors.purpleBcg,
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Вы отправите',
              style: AppFonts.font20w700.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Flexible(
                      child: CustomTextField(
                        hintText: "Кол-во",
                        controller: _enterCoinController, 
                        width: double.maxFinite)
                      ),
                  const SizedBox(
                    width: 8,
                  ),
                  ButtonChooseCoin(
                    coinName: 'SEX',
                    imagePath: 'assets/icons/coin.svg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
