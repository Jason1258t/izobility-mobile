import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class OrderItem extends StatelessWidget {
  final String title;
  final String prise;
  final String increment;
  final String value;
  final String usdValue;
  final String imageUrl;

  final VoidCallback onTap;

  const OrderItem(
      {super.key,
        required this.title,
        required this.prise,
        required this.increment,
        required this.onTap,
        required this.value,
        required this.usdValue,
        required this.imageUrl});

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
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary,
                          borderRadius: BorderRadius.circular(32),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
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
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary,
                          borderRadius: BorderRadius.circular(32),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
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
        ),
      ),
    );
  }
}
