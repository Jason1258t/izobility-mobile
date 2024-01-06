import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/wallet_auth/wallet_auth_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffol.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:izobility_mobile/widgets/text_field/big_text_field.dart';

class EnterSeedPhraseScreen extends StatefulWidget {
  const EnterSeedPhraseScreen({super.key});

  @override
  State<EnterSeedPhraseScreen> createState() => _EnterSeedPhraseScreenState();
}

class _EnterSeedPhraseScreenState extends State<EnterSeedPhraseScreen> {
  final seedPhraseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return BlocListener<WalletAuthCubit, WalletAuthState>(
      listener: (context, state) {
        ScaffoldMessenger.of(context).clearSnackBars();

        if (state is WalletAuthFailureState) {
          context.pop();

          ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.errorSnackBar(
                  localize.inapproprivate_seed_phrase));
        } else if (state is WalletAuthLoadingState) {
          Dialogs.show(
              context,
              const Center(
                child: CircularProgressIndicator.adaptive(),
              ));
        } else if (state is WalletAuthSuccessState) {
          context.pop();

          context.read<WalletRepository>().loadEmeraldCoin();
          context.push('${RouteNames.wallet}/true');
        }
      },
      child: WalletScaffold(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        backgroundColor: Colors.white,
        scaffoldColor: AppColors.purpleBcg,
        appBar: CustomAppBar(
          context: context,
          text: localize.enter_seed,
          onTap: () {
            context.pop();
          },
          isBack: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              OutLineTextField(
                onTapSuffixIcon: () {
                  Clipboard.getData(Clipboard.kTextPlain).then((value) {
                    setState(() {
                      seedPhraseController.text = value!.text!;
                    });
                  });
                },
                icon: 'assets/icons/clipboard.svg',
                controller: seedPhraseController,
                width: double.infinity,
                height: 200,
                maxLines: 7,
                hintText: localize.enter_seed,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: localize.to_come_in,
                  onTap: () {
                    context
                        .read<WalletAuthCubit>()
                        .authWalletBySeedPhrase(seedPhraseController.text);
                  },
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
