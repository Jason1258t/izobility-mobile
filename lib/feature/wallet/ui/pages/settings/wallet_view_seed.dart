import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';

class WalletViewSeedPhraseScreen extends StatefulWidget {
  const WalletViewSeedPhraseScreen({super.key});

  @override
  State<WalletViewSeedPhraseScreen> createState() =>
      _WalletViewSeedPhraseScreenState();
}

class _WalletViewSeedPhraseScreenState
    extends State<WalletViewSeedPhraseScreen> {
  @override
  Widget build(BuildContext context) {
    final walletSeed =
        context.read<WalletRepository>().walletModel!.mnemonic().split(" ");
    final localize = AppLocalizations.of(context)!;

    return WalletScaffold(
      scaffoldColor: AppColors.purpleBcg,
      backgroundColor: Colors.white,
      onTap: () {},
      appBar: CustomAppBar(
        context: context,
        isBack: true,
        text: localize.my_seed,
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...List.generate(
                  walletSeed.length,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 70,
                          child: Text(
                            "${index + 1}. ${walletSeed[index]}",
                            style: AppTypography.font14w700
                                .copyWith(color: Colors.black),
                            softWrap: false,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      )),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  height: 48,
                  text: localize.copy,
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: walletSeed.join(" ")));

                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(CustomSnackBar.snackBarCopied);
                  },
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
