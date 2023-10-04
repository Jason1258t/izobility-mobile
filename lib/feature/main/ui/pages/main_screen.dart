import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/main/bloc/main/main_screen_cubit.dart';
import 'package:izobility_mobile/feature/main/data/main_repository.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coin_in_game/coin_in_game_cubit.dart';
import 'package:izobility_mobile/feature/wallet/bloc/promo_code/promo_code_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:izobility_mobile/utils/ui/animations.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/containers/cash_container.dart';
import 'package:izobility_mobile/widgets/containers/utility_container.dart';
import 'package:izobility_mobile/widgets/indicators/notifications_indicator.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

import '../../../../widgets/containers/guides_suggestion.dart';
import '../../../../widgets/containers/market_Item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.sizeOf(context).width / 3.6,
                  fit: BoxFit.fitWidth,
                ),
                const Spacer(),
                BlocBuilder<CoinInGameCubit, CoinInGameState>(
                  builder: (context, state) {
                    if (state is CoinInGameSuccess) {
                      return CashContainer(
                          text: RepositoryProvider.of<WalletRepository>(context)
                              .emeraldInGameBalance
                              .toString(),
                          assetName: 'assets/images/emerald_coin.png');
                    }

                    return const CashContainer(
                        text: '0', assetName: 'assets/images/emerald_coin.png');
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                const NotificationsIndicator()
              ],
            ),
          ),
          body: BlocBuilder<MainScreenCubit, MainScreenState>(
            builder: (context, state) {
              final repository =
                  RepositoryProvider.of<MainScreenRepository>(context);
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UtilityContainer(
                                  name: 'QR\nСканер',
                                  assetName: 'assets/icons/qrscaner.svg',
                                  callback: () {
                                    context.push(RouteNames.develop);
                                  }),
                              UtilityContainer(
                                  name: 'AR\nСканер',
                                  assetName: 'assets/icons/aritem.svg',
                                  callback: () {
                                    context.push(RouteNames.develop);
                                  }),
                              UtilityContainer(
                                  name: 'AR\nКарта',
                                  assetName: 'assets/icons/armap.svg',
                                  callback: () {
                                    context.push(RouteNames.develop);
                                  }),
                            ],
                          ),
                          BlocListener<PromoCodeCubit, PromoCodeState>(
                            listener: (context, state) {
                              if (state is PromoActivateProcessState) {
                                Dialogs.showModal(
                                    context,
                                    const Center(
                                      child: AppAnimations
                                          .circularProgressIndicator,
                                    ));
                              } else {
                                Dialogs.hide(context);
                              }
                              final scaffoldMessenger =
                                  ScaffoldMessenger.of(context);
                              if (state is PromoActivatedState) {
                                scaffoldMessenger.showSnackBar(
                                    CustomSnackBar.snackBarWithCustomText(
                                        'Код активирован'));
                              }
                              if (state is PromoInvalidState) {
                                scaffoldMessenger.showSnackBar(
                                    CustomSnackBar.snackBarWithCustomText(
                                        'Ошибка активации'));
                              }
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: CustomTextField.withTwoIcon(
                                  suffixIconCallback: () {},
                                  obscured: false,
                                  secondSuffixIconCallback: () {
                                    Clipboard.getData('text/plain')
                                        .then((value) {
                                      setState(() {
                                        codeController.text = value != null
                                            ? value.text ?? codeController.text
                                            : codeController.text;
                                      });
                                    });
                                  },
                                  controller: codeController,
                                  width: double.infinity,
                                  backgroundColor: Colors.white,
                                  hintText: 'Ваш промо-код',
                                  onChange: (v) {
                                    setState(() {});
                                  },
                                )),
                          ),
                          if (codeController.text.isNotEmpty) ...[
                            CustomButton(
                                text: 'Активировать',
                                onTap: () {
                                  BlocProvider.of<PromoCodeCubit>(context)
                                      .activateCode(codeController.text.trim());
                                  setState(() {
                                    codeController.text = '';
                                  });
                                },
                                width: double.infinity),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                          InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              context.go(RouteNames.games);
                            },
                            child: Ink(
                              child: Image.asset(
                                'assets/images/Frame 1000007448.png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width - 32,
                              height: 102,
                              child: state is MainScreenPreview
                                  ? ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: repository.storiesList.length,
                                      itemBuilder: (ctx, ind) =>
                                          GuidesSuggestion(
                                            text: repository
                                                .storiesList[ind].title,
                                            imageUrl: repository
                                                .storiesList[ind].previewUrl,
                                            onTap: () {
                                              context.go(
                                                  '${RouteNames.story}/$ind');
                                            },
                                            viewed: false,
                                          ))
                                  : Container(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Магазин',
                                style: AppTypography.font24w700
                                    .copyWith(color: Colors.black),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context.go(RouteNames.basket);
                                },
                                child: Ink(
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 6, bottom: 6),
                                  child: Text(
                                    'Ещё',
                                    style: AppTypography.font12w400
                                        .copyWith(color: AppColors.disable),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width - 32,
                              height: 260,
                              child: state is MainScreenPreview
                                  ? ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: repository.marketItems.length,
                                      itemBuilder: (ctx, ind) => MarketItem(
                                            coinData: repository
                                                .marketItems[ind].coins,
                                            textDescription: repository
                                                .marketItems[ind].name,
                                            imageUrl: repository
                                                .marketItems[ind].imageUrl,
                                            onTap: () {
                                              context.push(
                                                  "/store/${repository.marketItems[ind].id}");
                                            },
                                            isNew: repository
                                                .marketItems[ind].isNew,
                                            pizdulkaUrl: '',
                                          ))
                                  : Container(),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ]),
                  ),
                ),
              );
            },
          )),
    );
  }
}
