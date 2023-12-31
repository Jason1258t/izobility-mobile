import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/burse_create_order/burse_create_order_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/burse_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_choose_coin.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_swop.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class BurseCreateOrderScreen extends StatefulWidget {
  const BurseCreateOrderScreen({super.key});

  @override
  State<BurseCreateOrderScreen> createState() => _BurseCreateOrderScreenState();
}

class _BurseCreateOrderScreenState extends State<BurseCreateOrderScreen> {
  final _sendController = TextEditingController();
  final _getController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return WalletScaffold(
      onTap: () {},
      backgroundColor: Colors.white,
      scaffoldColor: AppColors.purpleBcg,
      appBar: CustomAppBar(
        context: context,
        text: localize.creating_order,
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: BlocListener<BurseCreateOrderCubit, BurseCreateOrderState>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).clearSnackBars();

              if (state is BurseCreateOrderSuccess) {
                context.pop();

                context.push(RouteNames.walletBurseCreateOrderSuccess);
              } else if (state is BurseCreateOrderFailure) {
                context.pop();

                ScaffoldMessenger.of(context)
                    .showSnackBar(CustomSnackBar.errorSnackBar(localize.erro));
              } else if (state is BurseCreateOrderLoading) {
                Dialogs.show(
                    context,
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ));
              }
            },
            child: buildCreateOrderWidget(),
          )),
    );
  }

  Widget buildCreateOrderWidget() {
    final size = MediaQuery.sizeOf(context);
    final localize = AppLocalizations.of(context)!;
    final burseRepository = RepositoryProvider.of<BurseRepository>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          localize.you_send,
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
                      hintText: localize.quantity,
                      controller: _sendController,
                      width: double.maxFinite)),
              const SizedBox(
                width: 8,
              ),
              ButtonChooseCoin(
                width: size.width * 0.3555,
                coinName: burseRepository.activeBurseTokenFrom!.name,
                imagePath: burseRepository.activeBurseTokenFrom!.imageUrl,
                onTap: () {
                  context
                      .push(RouteNames.walletBurseChooseCoin, extra: true)
                      .then((value) => setState(() {}));
                },
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: ButtonSwap(
            onTap: () {},
          ),
        ),
        Text(
          localize.you_get,
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
                      hintText: localize.quantity,
                      controller: _getController,
                      width: double.maxFinite)),
              const SizedBox(
                width: 8,
              ),
              ButtonChooseCoin(
                width: size.width * 0.3555,
                coinName: burseRepository.activeBurseTokenTo!.name,
                imagePath: burseRepository.activeBurseTokenTo!.imageUrl,
                onTap: () {
                  context
                      .push(RouteNames.walletBurseChooseCoin, extra: false)
                      .then((value) => setState(() {}));
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomButton(
            text: localize.create_your_own_order,
            onTap: () {
              context.read<BurseCreateOrderCubit>().createOrder(
                  int.parse(_sendController.text),
                  int.parse(_getController.text));
            },
            width: double.infinity)
      ],
    );
  }
}
