import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coin_send/coin_send_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class SendOnChainCoinScreen extends StatefulWidget {
  const SendOnChainCoinScreen({super.key, required this.coin});

  final TokenData coin;

  @override
  State<SendOnChainCoinScreen> createState() => _SendOnChainCoinScreenState();
}

class _SendOnChainCoinScreenState extends State<SendOnChainCoinScreen> {
  final addressController = TextEditingController();
  final amountController = TextEditingController();

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final walletRepository = context.read<WalletRepository>();
    final localize = AppLocalizations.of(context)!;

    return BlocListener<CoinSendCubit, CoinSendState>(
      listener: (context, state) {
        ScaffoldMessenger.of(context).clearSnackBars();

        if (state is CoinSendFailure) {
          context.pop();

          ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.errorSnackBar(
                  localize.inapproprivate_seed_phrase));
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
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        backgroundColor: Colors.white,
        scaffoldColor: AppColors.purpleBcg,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            CustomSliverAppBar(
              height: 90,
              isBack: true,
              title: localize.send,
              color: Colors.white,
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverAppBarDelegate(
                minHeight: 115,
                maxHeight: 115,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(widget.coin.imageUrl))),
                        ),
                      ),
                      Text(
                          walletRepository.obscured
                              ? AppStrings.obscuredText
                              : widget.coin.amount,
                          style: AppTypography.font36w700
                              .copyWith(color: AppColors.textPrimary)),
                      Text(
                        walletRepository.obscured
                            ? AppStrings.obscuredText
                            : '≈ ${widget.coin.rubleExchangeRate} ₽',
                        style: AppTypography.font16w400
                            .copyWith(color: AppColors.grey600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverAppBarDelegate(
                minHeight: 17,
                maxHeight: 17,
                child: Container(
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16))),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 20),
                child: CustomTextField.withOneIcon(
                  obscured: false,
                  suffixIconChild:
                      SvgPicture.asset('assets/icons/clipboard.svg'),
                  hintText: localize.address,
                  suffixIconCallback: () {
                    Clipboard.getData(Clipboard.kTextPlain).then((value) {
                      setState(() {
                        addressController.text = value!.text!;
                      });
                    });
                  },
                  controller: addressController,
                  width: double.infinity,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 20),
                child: CustomTextField.withOneIcon(
                  errorText: localize.your_balance_smaller,
                  error: isError,
                  onChange: (val) {
                    setState(() {
                      if (double.parse(widget.coin.amount.toString()) <
                          double.parse(val!)) {
                        isError = true;
                        return;
                      }
                      isError = false;
                    });
                  },
                  keyboardType: TextInputType.number,
                  obscured: false,
                  suffixIconChild: Image.network(
                    widget.coin.imageUrl,
                    width: 25,
                  ),
                  hintText: localize.sum,
                  suffixIconCallback: () {},
                  controller: amountController,
                  width: double.infinity,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 20),
                child: CustomButton(
                  isActive: !isError,
                  text: localize.continue_,
                  onTap: () {
                    final address = addressController.text;
                    final amount = double.parse(amountController.text);

                    context.read<CoinSendCubit>().sendCoinOnChain(
                        address, amount, int.parse(widget.coin.id));
                  },
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
