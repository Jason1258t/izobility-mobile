import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/cards/ui/widgets/card_transaction_widget.dart';
import 'package:izobility_mobile/feature/cards/ui/widgets/credit_card_widget.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
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
    final localize = AppLocalizations.of(context)!;
    return HomeScaffold(
      backgroundColor: AppColors.purpleBcg,
      appBar: CustomAppBar(
        onTap: () {
          context.pop();
        },
        context: context,
        text: localize.cards,
        isBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: sizeOf.width * 0.45,
              constraints: const BoxConstraints(minHeight: 170),
              child: PageView.builder(
                  itemCount: 4,
                  controller: pageController,
                  pageSnapping: true,
                  itemBuilder: (context, index) {
                    if (index != 3) {
                      return const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CreditCardWidget(),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: InkWell(
                          onTap: () {
                            context.push(RouteNames.cardsAdd);
                          },
                          child: Container(
                              width: sizeOf.width - 40,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.purple200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: sizeOf.width * 0.2,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.purple400,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: AppColors.purple400,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        child: Container(
                                          width: double.infinity,
                                          height: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary2,
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Text('Привязать карту', style: AppTypography.font14w400,),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    }
                  }),
            ),
            const SizedBox(
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
                              title: localize.send,
                              icon: 'assets/icons/send.svg',
                              onTap: () {},
                              color: AppColors.purple400,
                            ),
                            WalletAction(
                              title: localize.replenish,
                              icon: 'assets/icons/get.svg',
                              onTap: () {},
                              color: AppColors.purple400,
                            ),
                            WalletAction(
                              title: localize.buy,
                              icon: 'assets/icons/buy.svg',
                              onTap: () {},
                              color: AppColors.purple400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    localize.story,
                    style: AppTypography.font12w700
                        .copyWith(color: AppColors.grey600),
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
