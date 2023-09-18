import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

class ValidToken extends StatelessWidget {
  final String title;
  final String prise;
  final String increment;
  final String value;
  final String usdValue;

  final VoidCallback onTap;

  const ValidToken(
      {super.key,
      required this.title,
      required this.prise,
      required this.increment,
      required this.onTap,
      required this.value,
      required this.usdValue});

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
                      width: 34,
                      height: 34,
                      padding: const EdgeInsets.all(4),
                      decoration: ShapeDecoration(
                        color: AppColors.backgroundSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
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
                          style: AppFonts.font16w400
                              .copyWith(color: AppColors.textPrimary),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(children: [
                          Text('$value\$',
                              style: AppFonts.font14w400.copyWith(
                                  color: AppColors.disabledTextButton)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('+$increment',
                              style: AppFonts.font14w400
                                  .copyWith(color: AppColors.green))
                        ])
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(prise,
                        style: AppFonts.font16w400
                            .copyWith(color: AppColors.textPrimary)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(usdValue,
                        style: AppFonts.font12w400
                            .copyWith(color: AppColors.disabledTextButton)),
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
