import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/cards/ui/widgets/card_transaction_widget.dart';
import 'package:izobility_mobile/feature/cards/ui/widgets/credit_card_widget.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return HomeScaffold(
      backgroundColor: AppColors.purpleBcg,
      appBar: CustomAppBar(
        backgroundColor: AppColors.purpleBcg,
        onTap: () {
          context.pop();
        },
        context: context,
        text: 'Карты',
        isBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
              child: PageView.builder(
                  itemCount: 3,
                  controller: pageController,
                  pageSnapping: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CreditCardWidget(),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: sizeOf.width * 0.156 + 60,
                    decoration: BoxDecoration(
                      color: AppColors.purple100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WalletAction(
                              title: 'Отправить',
                              icon: 'assets/icons/send.svg',
                              onTap: () {},
                            ),
                            WalletAction(
                              title: 'Пополнить',
                              icon: 'assets/icons/get.svg',
                              onTap: () {},
                            ),
                            WalletAction(
                              title: 'Купить',
                              icon: 'assets/icons/buy.svg',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'История',
                    style: AppFonts.font12w700
                        .copyWith(color: AppColors.blackGraySecondary),
                  ),
                  Column(
                    children: List.generate(
                        20,
                        (index) => CardTransactionContainer(
                              title: 'Izobility',
                              onTap: () {},
                              prise: '+ 2000',
                              secondaryTitle: 'Покупка',
                              usdValue: 'Тинькофф **** 3434',
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}