import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/swap_in_game_coins/swap_in_game_coins_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_choose_coin.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_swop.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  final TextEditingController _enterCoinController = TextEditingController();
  final TextEditingController _getCoinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    final walletRepository = RepositoryProvider.of<WalletRepository>(context);
    final swapInGameCoinsCubit = BlocProvider.of<SwapInGameCoinsCubit>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<SwapInGameCoinsCubit, SwapInGameCoinsState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).clearSnackBars();

          if (state is SwapInGameCoinsFail) {
            context.pop();

            ScaffoldMessenger.of(context)
                .showSnackBar(CustomSnackBar.errorSnackBar('ошибка перевода'));
          } else if (state is SwapInGameCoinsLoading) {
            Dialogs.show(
                context,
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ));
          } else if (state is SwapInGameCoinsSuccess) {
            context.pop();

            ScaffoldMessenger.of(context).showSnackBar(
                CustomSnackBar.successSnackBar('Успешно отправлено'));
          }
        },
        child: HomeScaffold(
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
                  style: AppTypography.font20w700.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 56,
                  child: Row(
                    children: [
                      Flexible(
                          child: CustomTextField(
                              keyboardType: TextInputType.number,
                              backgroundColor: Colors.white,
                              hintText: "Кол-во",
                              controller: _enterCoinController,
                              width: double.maxFinite)),
                      const SizedBox(
                        width: 8,
                      ),
                      ButtonChooseCoin(
                        width: size.width * 0.3555,
                        coinName: walletRepository.activeSwapTockenFrom!.name,
                        imagePath:
                            walletRepository.activeSwapTockenFrom!.imageUrl,
                        onTap: () {
                          context.push(RouteNames.walletChooseCoin, extra: {
                            'path': AppStrings.nullText,
                            'fromOrTo': true
                          }).then((value) => setState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: ButtonSwap(
                    onTap: () {
                      swapInGameCoinsCubit.swapInGameCoins(
                          int.parse(_enterCoinController.text),
                          int.parse(walletRepository.activeSwapTockenTo!.id),
                          int.parse(walletRepository.activeSwapTockenFrom!.id));
                    },
                  ),
                ),
                Text(
                  'Вы получите',
                  style: AppTypography.font20w700.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 56,
                  child: Row(
                    children: [
                      Flexible(
                          child: CustomTextField(
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              backgroundColor: Colors.white,
                              hintText: "Кол-во",
                              controller: _getCoinController,
                              width: double.maxFinite)),
                      const SizedBox(
                        width: 8,
                      ),
                      ButtonChooseCoin(
                        width: size.width * 0.3555,
                        coinName: walletRepository.activeSwapTockenTo!.name,
                        imagePath:
                            walletRepository.activeSwapTockenTo!.imageUrl,
                        onTap: () {
                          context.push(RouteNames.walletChooseCoin, extra: {
                            'path': AppStrings.nullText,
                            'fromOrTo': false
                          }).then((value) => setState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
