import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';

class WalletAuthScreen extends StatefulWidget {
  const WalletAuthScreen({super.key});

  @override
  State<WalletAuthScreen> createState() => WalletAuthScreenState();
}

class WalletAuthScreenState extends State<WalletAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final walletRepository = RepositoryProvider.of<WalletRepository>(context);
    final localize = AppLocalizations.of(context)!;

    return WalletScaffold(
      onTap: () {},
      appBar: CustomAppBar(
        context: context,
        isBack: false,
        text: localize.wallet,
      ),
      scaffoldColor: AppColors.purpleBcg,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                await walletRepository
                    .createWallet()
                    .then((value) => context.push('${RouteNames.wallet}/true'));
              },
              child: Ink(
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localize.create_wallet,
                      style: AppTypography.font16w700
                          .copyWith(color: AppColors.textPrimary),
                    ),
                    Image.asset(
                      'assets/images/bag.png',
                      width: 130,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              localize.or,
              style: AppTypography.font14w400
                  .copyWith(color: AppColors.disabledTextButton),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                context.push(RouteNames.walletEnterSeedPhrase);
              },
              child: Ink(
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localize.enter_seed_phrase,
                      style: AppTypography.font16w700
                          .copyWith(color: AppColors.textPrimary),
                    ),
                    Image.asset(
                      'assets/images/lock.png',
                      width: 130,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
