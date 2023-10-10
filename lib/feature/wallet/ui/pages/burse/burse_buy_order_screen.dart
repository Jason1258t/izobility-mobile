import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/models/burse/burse_order.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';

class BurseBuyOrderScreen extends StatefulWidget {
  const BurseBuyOrderScreen({super.key, required this.order});

  final BurseOrderModel order;

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundSecondary,
                                  borderRadius: BorderRadius.circular(32),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.order.coinFrom.logo),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.order.amountFrom} ${widget.order.coinFrom.codename}',
                                  style: AppTypography.font16w400
                                      .copyWith(color: AppColors.textPrimary),
                                ),
                                Text('Отправить',
                                    style: AppTypography.font14w400.copyWith(
                                        color: AppColors.disabledTextButton))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundSecondary,
                                  borderRadius: BorderRadius.circular(32),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.order.coinTo.logo),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.order.amountTo} ${widget.order.coinTo.codename}',
                                  style: AppTypography.font16w400
                                      .copyWith(color: AppColors.textPrimary),
                                ),
                                Text('Отправить',
                                    style: AppTypography.font14w400.copyWith(
                                        color: AppColors.disabledTextButton))
                              ],
                            ),
                          ],
                        ),
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
                        "Размещено: ${widget.order.createdAt}",
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
