import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_text_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class WalletAuthScreen extends StatefulWidget {
  const WalletAuthScreen({super.key});

  @override
  State<WalletAuthScreen> createState() => WalletAuthScreenState();
}

class WalletAuthScreenState extends State<WalletAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final walletRepository = RepositoryProvider.of<WalletRepository>(context);

    return HomeScaffold(
        backgroundColor: AppColors.purpleBcg,
        appBar: CustomAppBar(
          context: context,
          isBack: false,
          text: "Кошелек",
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Ink(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Создать кошелек',
                        style: AppTypography.font16w700
                            .copyWith(color: AppColors.textPrimary),
                      ),
                      Image.asset(
                        'assets/images/money_bag.png',
                        height: 120,
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                'или',
                style: AppTypography.font14w400
                    .copyWith(color: AppColors.disabledTextButton),
              ),
              const SizedBox(height: 10,),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  context.push(RouteNames.walletEnterSeedPhrase);
                },
                child: Ink(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Войти по Seed-фразе',
                        style: AppTypography.font16w700
                            .copyWith(color: AppColors.textPrimary),
                      ),
                      Image.asset(
                        'assets/images/money_bag.png',
                        height: 120,
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
