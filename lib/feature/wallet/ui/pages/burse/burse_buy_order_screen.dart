import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class BurseBuyOrderScreen extends StatefulWidget {
  const BurseBuyOrderScreen({super.key});

  @override
  State<BurseBuyOrderScreen> createState() => _BurseBuyOrderScreenState();
}

class _BurseBuyOrderScreenState extends State<BurseBuyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: AppColors.backgroundGrey,
        appBar: CustomAppBar(
          context: context,
          text: "Покупка заказа",
          isBack: true,
          onTap: () {
            context.pop();
          },
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.red,
                          height: 20,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: AppColors.gradient),
                            child: SvgPicture.asset(
                              'assets/icons/transfer_arrows.svg',
                              color: Colors.black,
                              width: 20,
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          color: Colors.red,
                          height: 20,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Комиссия площадки: 1.0 STR",
                        style: AppTypography.font12w400
                            .copyWith(color: AppColors.grey500),
                      )),
                ],
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Размещено: 11.08.2023 20:29",
                        style: AppTypography.font12w400
                            .copyWith(color: AppColors.grey500),
                      )),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomButton(
                      text: "Купить", onTap: () {}, width: double.infinity)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
