import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/main/bloc/main/main_screen_cubit.dart';
import 'package:izobility_mobile/feature/main/data/main_repository.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/banners/exchange.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/banners/games.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/guides_suggestion_loading.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/market_item.dart';
import 'package:izobility_mobile/feature/store/bloc/store_buy/store_buy_cubit.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coin_in_game/coin_in_game_cubit.dart';
import 'package:izobility_mobile/feature/wallet/bloc/promo_code/promo_code_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/animations.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/button_sheet/bottom_sheets.dart';
import 'package:izobility_mobile/widgets/containers/cash_container.dart';
import 'package:izobility_mobile/widgets/indicators/notifications_indicator.dart';
import 'package:izobility_mobile/widgets/popup/popup_promo_failure.dart';
import 'package:izobility_mobile/widgets/popup/popup_promo_success.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

import '../../../../widgets/containers/guides_suggestion.dart';
import '../../../../widgets/containers/market_Item.dart';

final _oldActivityBanner = Material(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      // context.go(RouteNames.games);
    },
    child: Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 180),
            height: double.infinity,
            // width: size.width * 0.28,
            child: Image.asset(
              "assets/images/activity_man.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            // width: size.width * 0.58,
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/controller.svg"),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Активности",
                      style: AppTypography.font18w700
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "AR, QR, игры и т.д.",
                      style: AppTypography.font12w400
                          .copyWith(color: AppColors.grey600),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ),
);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController codeController = TextEditingController();
  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    final sizeOf = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<StoreBuyCubit, StoreBuyState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).clearSnackBars();

          if (state is StoreBuyLoading) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ));
          } else if (state is StoreBuyFailure) {
            context.pop();

            ScaffoldMessenger.of(context)
                .showSnackBar(CustomSnackBar.successSnackBar(localize.erro));
          } else if (state is StoreBuySuccess) {
            print('------ popped');
            context.pop(); // clear dialog
            context.pop(); // clear modal

            AppBottomSheets.productBought(context);
          }
        },
        child: Scaffold(
            backgroundColor: AppColors.purpleBcg,
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              title: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/top page navigation.svg',
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
                        );
                      }
                      return const CashContainer(
                        text: '0',
                      );
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
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await repository.getPreview();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: sizeOf.width * 0.3,
                            constraints:
                            const BoxConstraints(minHeight: 170),
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              controller: pageController,
                              children: [
                                'Frame 1000007449.png',
                                'Frame 1000007788.png',
                                'Frame 1000007789.png'
                              ].map((e) {
                                return InkWell(

                                  onTap: (){
                                    if(e == 'Frame 1000007449.png'){
                                      context.go(RouteNames.games);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/$e'),
                                          )),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // const GamesBanner(),
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

                                      if (state is PromoActivatedState) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => PopupPromoSuccess(
                                                  coinName: state.coinName,
                                                  coinAmount: state.coinAmount,
                                                ));
                                      }
                                      if (state is PromoInvalidState) {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const PopupPromoFailure());
                                      }
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        child: CustomTextField.withTwoIcon(
                                          suffixIconCallback: () {
                                            context.push(RouteNames.mainQr, extra: {
                                              "onFound": (data) => context
                                                  .read<PromoCodeCubit>()
                                                  .activateCode(
                                                      data.code.toString())
                                            });
                                          },
                                          secondSuffixIconCallback: () {
                                            Clipboard.getData('text/plain')
                                                .then((value) {
                                              setState(() {
                                                codeController.text = value != null
                                                    ? value.text ??
                                                        codeController.text
                                                    : codeController.text;
                                              });

                                              FocusScope.of(context).unfocus();
                                            });
                                          },
                                          obscured: false,
                                          controller: codeController,
                                          width: double.infinity,
                                          backgroundColor: Colors.white,
                                          hintText: localize.your_promo,
                                          onChange: (v) {
                                            setState(() {});
                                          },
                                        )),
                                  ),
                                  if (codeController.text.isNotEmpty) ...[
                                    CustomButton(
                                        text: localize.activate,
                                        onTap: () {
                                          BlocProvider.of<PromoCodeCubit>(context)
                                              .activateCode(
                                                  codeController.text.trim());
                                          setState(() {
                                            codeController.text = '';
                                          });
                                        },
                                        width: double.infinity),
                                    const SizedBox(
                                      height: 16,
                                    )
                                  ],
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 16),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width - 32,
                                      height: 102,
                                      child: state is MainScreenPreview
                                          ? ListView.builder(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 2),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount:
                                                  repository.storiesList.length,
                                              itemBuilder: (ctx, ind) =>
                                                  GuidesSuggestion(
                                                    text: repository
                                                        .storiesList[ind].title,
                                                    imageUrl: repository
                                                        .storiesList[ind]
                                                        .previewUrl,
                                                    onTap: () {
                                                      context.go(
                                                          '${RouteNames.story}/$ind');
                                                    },
                                                    viewed: false,
                                                  ))
                                          : ListView.builder(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 2),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder: (ctx, ind) =>
                                                  const GuidesSuggestionLoading()),
                                    ),
                                  ),
                                  const Divider(
                                    color: AppColors.disableButton,
                                    height: 1,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ExchangeBanner(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        localize.shop,
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
                                            localize.more,
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
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width - 32,
                                    height:
                                        (MediaQuery.of(context).size.width - 40) /
                                                2 *
                                                240 /
                                                160 +
                                            10,
                                    child: state is MainScreenPreview
                                        ? ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount:
                                                repository.marketItems.length,
                                            itemBuilder: (ctx, ind) => MarketItem(
                                                  marketItem:
                                                      repository.marketItems[ind],
                                                ))
                                        : ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount:
                                                repository.marketItems.length,
                                            itemBuilder: (ctx, ind) =>
                                                const MarketItemLoading()),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
