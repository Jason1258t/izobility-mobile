import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/store/bloc/store_buy/store_buy_cubit.dart';
import 'package:izobility_mobile/feature/store/bloc/store_cubit.dart';
import 'package:izobility_mobile/models/market_item.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';

class AppBottomSheets {
  static void buyProductBottomSheet(context, MarketItemModel marketItem) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 54,
                  height: 2,
                  color: AppColors.grey200,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(1000),
                      onTap: () => context.pop(),
                      child: SvgPicture.asset(
                        "assets/icons/cross_rounded.svg",
                        color: AppColors.grey200,
                        width: 30,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                          marketItem.coin.imageUrl,
                          width: 36,
                        )),
                    Text(
                      "${marketItem.price} ${marketItem.coin.name}",
                      style: AppTypography.font20w700
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                CustomButton(
                    text: "Купить",
                    onTap: () {
                      context.read<StoreBuyCubit>().buyProduct(int.parse(marketItem.id));
                    },
                    width: double.infinity),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
          );
        });
  }
}
