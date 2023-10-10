import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/models/api/burse_transfer.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/models/burse/burse_order.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class OrderItem extends StatelessWidget {
  final VoidCallback onTap;
  final BurseOrderModel order;

  const OrderItem({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          width: double.infinity,
          height: 64,
          decoration: ShapeDecoration(
              color: AppColors.textContrast,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width - 94) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColors.backgroundSecondary,
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(
                                image: NetworkImage(order.coinFrom.logo),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    order.amountFrom,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTypography.font16w400.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  )),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                order.coinFrom.codename,
                                style: AppTypography.font16w400
                                    .copyWith(color: AppColors.textPrimary),
                              ),
                            ],
                          ),
                          Text('Отправить',
                              style: AppTypography.font16w400.copyWith(
                                  color: AppColors.disabledTextButton))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, gradient: AppColors.gradient),
                    child: SvgPicture.asset(
                      'assets/icons/transfer_arrows.svg',
                      color: Colors.black,
                      width: 20,
                    )),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width - 94) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColors.backgroundSecondary,
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(
                                image: NetworkImage(order.coinTo.logo),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    order.amountTo,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTypography.font16w400.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  )),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                order.coinTo.codename,
                                style: AppTypography.font16w400
                                    .copyWith(color: AppColors.textPrimary),
                              ),
                            ],
                          ),
                          Text('Получить',
                              style: AppTypography.font14w400.copyWith(
                                  color: AppColors.disabledTextButton))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
