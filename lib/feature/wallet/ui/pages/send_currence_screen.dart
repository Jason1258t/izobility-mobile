import 'package:flutter/material.dart';
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
                  title: 'Usd',
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
                            backgroundColor: AppColors.primary,
                          ),
                          Text('123 123\$',
                              style: AppFonts.font36w700
                                  .copyWith(color: AppColors.textPrimary)),
                          Text(
                            '≈ 2,545 \$',
                            style: AppFonts.font16w400
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
                      onTap: () {},
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