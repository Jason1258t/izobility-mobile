import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coin_send/coin_send_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class WalletGameChainTransferScreen extends StatefulWidget {
  const WalletGameChainTransferScreen({super.key, required this.coin});

  final TokenData coin;

  @override
  State<WalletGameChainTransferScreen> createState() =>
      _WalletGameChainTransferState();
}

class _WalletGameChainTransferState
    extends State<WalletGameChainTransferScreen> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WalletRepository walletRepository = context.read<WalletRepository>();
    final localize = AppLocalizations.of(context)!;
    return BlocListener<CoinSendCubit, CoinSendState>(
      listener: (context, state) {
        ScaffoldMessenger.of(context).clearSnackBars();

        if (state is CoinSendFailure) {
          context.pop();

          ScaffoldMessenger.of(context)
              .showSnackBar(CustomSnackBar.errorSnackBar(localize.erro));
        } else if (state is CoinSendLoading) {
          Dialogs.show(
              context,
              const Center(
                child: CircularProgressIndicator.adaptive(),
              ));
        } else if (state is CoinSendSuccess) {
          context.pop();

          ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.successSnackBar(localize.succedssfully_sent));
        }
      },
      child: WalletScaffold(
        appBar: CustomAppBar(
          context: context,
          text: localize.operation_with_coin,
          isBack: true,
          onTap: () {
            context.pop();
          },
        ),
        backgroundColor: Colors.white,
        scaffoldColor: AppColors.purpleBcg,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      context
                          .pushReplacement(RouteNames.walletChooseCoin, extra: {
                        'path': 'chain_game_transfer',
                        'fromOrTo': walletRepository.transferType ==
                            TransferTypes.onChain
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 32,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000)),
                              child: Image.network(
                                widget.coin.imageUrl,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            widget.coin.name,
                            style: AppTypography.font16w400
                                .copyWith(color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset("assets/icons/arrow_right.svg",
                              color: Colors.black)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localize.from,
                              style: AppTypography.font14w400
                                  .copyWith(color: AppColors.grey700),
                            ),
                            Text(
                                walletRepository.transferType ==
                                        TransferTypes.inGame
                                    ? "InGame"
                                    : "OnChain",
                                style: AppTypography.font18w700
                                    .copyWith(color: Colors.black)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 1,
                              color: Colors.grey[200],
                            ),
                            Text(localize.to,
                                style: AppTypography.font14w400
                                    .copyWith(color: AppColors.grey700)),
                            Text(
                              walletRepository.transferType !=
                                      TransferTypes.inGame
                                  ? "InGame"
                                  : "OnChain",
                              style: AppTypography.font18w700
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(1000),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(1000),
                          onTap: () {
                            context.read<CoinSendCubit>().changeTransferType();
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            "assets/icons/transfer_arrows_bold.svg",
                            color: AppColors.primary,
                            width: 37,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    hintText: localize.quantity,
                    backgroundColor: Colors.white,
                    controller: amountController,
                    width: MediaQuery.sizeOf(context).width),
                const SizedBox(
                  height: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${localize.available}: ${widget.coin.amount}",
                      style: AppTypography.font12w400
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "GAS: ${walletRepository.gas}",
                      style: AppTypography.font12w400
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    text: localize.send,
                    onTap: () {
                      context.read<CoinSendCubit>().transferCoinGameChain(
                          int.parse(widget.coin.id),
                          double.parse(amountController.text));
                    },
                    width: MediaQuery.sizeOf(context).width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
