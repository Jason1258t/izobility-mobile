import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReplenishScreen extends StatefulWidget {
  const ReplenishScreen({super.key});

  @override
  State<ReplenishScreen> createState() => _ReplenishScreenState();
}

class _ReplenishScreenState extends State<ReplenishScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: 'Получить %Валюты%',
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: Container(
        color: AppColors.purpleBcg,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: QrImageView(
                      data: '0xe92d1a43df510f82c66382592a047d288f85226f',
                      version: QrVersions.auto,
                      size: sizeOf.width / 2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: sizeOf.width / 2,
                    child: Text(
                      '0xe92d1a43df510f82c66382592a047d288f85226f',
                      maxLines: 2,
                      style: AppFonts.font14w400
                          .copyWith(color: AppColors.disabledTextButton),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: sizeOf.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WalletAction(
                          title: 'Копировать',
                          icon: 'assets/icons/copy.svg',
                          onTap: () {
                            Clipboard.setData(new ClipboardData(
                                text:
                                    '0xe92d1a43df510f82c66382592a047d288f85226f'));
                            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBar);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        WalletAction(
                          iconColor: AppColors.primary,
                          title: 'Копировать',
                          icon: 'assets/icons/share.svg',
                          onTap: () {},
                          isActive: false,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
