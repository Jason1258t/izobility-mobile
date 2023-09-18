import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_choose_coin.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_swop.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  TextEditingController _enterCoinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Своп",
        isBack: true,
        onTap: () {
          context.pop();
        },
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
                          backgroundColor: Colors.white,
                          hintText: "Кол-во",
                          controller: _enterCoinController,
                          width: double.maxFinite)),
                  const SizedBox(
                    width: 8,
                  ),
                  ButtonChooseCoin(
                    width: size.width * 0.3555,
                    coinName: 'SEX',
                    imagePath: 'assets/icons/coin.svg',
                    onTap: () {
                      context.push('${RouteNames.walletChooseCoin}/${AppStrings.nullText}');
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: ButtonSwop(
                onTap: () {},
              ),
            ),
            Text(
              'Вы получите',
              style: AppFonts.font20w700.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Flexible(
                      child: CustomTextField(
                          backgroundColor: Colors.white,
                          hintText: "Кол-во",
                          controller: _enterCoinController,
                          width: double.maxFinite)),
                  const SizedBox(
                    width: 8,
                  ),
                  ButtonChooseCoin(
                    width: size.width * 0.3555,
                    coinName: 'WWWWWWWWW',
                    imagePath: 'assets/icons/coin.svg',
                    onTap: () {
                      context.push('${RouteNames.walletChooseCoin}/${AppStrings.nullText}');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}