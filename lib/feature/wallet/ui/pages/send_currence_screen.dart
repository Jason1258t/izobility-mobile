import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class SendCurrencyScreen extends StatefulWidget {
  const SendCurrencyScreen({super.key});

  @override
  State<SendCurrencyScreen> createState() => _SendCurrencyScreenState();
}

class _SendCurrencyScreenState extends State<SendCurrencyScreen> {
  final addressController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletRepository = context.read<WalletRepository>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: AppColors.purple200,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.purpleBcg,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              slivers: [
                const CustomSliverAppBar(
                  height: 90,
                  isBack: true,
                  title: 'Отправить',
                  color: AppColors.purple200,
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: SliverAppBarDelegate(
                    minHeight: 115,
                    maxHeight: 115,
                    child: Container(
                      color: AppColors.purple200,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/emerald_coin.png'),
                          ),
                          Text(
                              walletRepository.obscured
                                  ? AppStrings.obscuredText
                                  : "${walletRepository.emeraldInWalletBalance}"
                                      .toString(),
                              style: AppTypography.font36w700
                                  .copyWith(color: AppColors.textPrimary)),
                          Text(
                            walletRepository.obscured
                                ? AppStrings.obscuredText
                                : '', // here might be price in rub or dollars
                            style: AppTypography.font16w400
                                .copyWith(color: AppColors.blackGraySecondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: SliverAppBarDelegate(
                    minHeight: 17,
                    maxHeight: 17,
                    child: Container(
                      height: 18,
                      decoration: const BoxDecoration(
                          color: AppColors.purple200,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16))),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 20),
                    child: CustomTextField.withTwoIcon(
                      hintText: "Адрес или имя",
                      suffixIconCallback: () {},
                      secondSuffixIconCallback: () {},
                      controller: addressController,
                      width: double.infinity,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 20),
                    child: CustomTextField.withOneIcon(
                      hintText: "Сумма",
                      suffixIconCallback: () {},
                      controller: amountController,
                      width: double.infinity,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 20),
                    child: CustomButton(
                      text: 'Продолжить',
                      onTap: () {
                        final address = addressController.text;
                        final amount = amountController.text;
                      },
                      width: double.infinity,
                    ),
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
