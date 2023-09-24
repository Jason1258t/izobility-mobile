import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/button_social_media_link.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

final list = List.generate(100, (index) => 1);

class InfoCurrencyWalletScreen extends StatefulWidget {
  const InfoCurrencyWalletScreen({super.key});

  @override
  State<InfoCurrencyWalletScreen> createState() =>
      _InfoCurrencyWalletScreenState();
}

class _InfoCurrencyWalletScreenState extends State<InfoCurrencyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    final walletRepository = context.read<WalletRepository>();

    return Container(
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
                        Text(
                            walletRepository.obscured
                                ? AppStrings.obscuredText
                                : '123 123\$',
                            style: AppFonts.font36w700
                                .copyWith(color: AppColors.textPrimary)),
                        Text(
                          walletRepository.obscured
                              ? AppStrings.obscuredText
                              : '≈ 2,545 \$',
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
                floating: true,
                delegate: SliverAppBarDelegate(
                  minHeight: sizeOf.width * 0.156 + 40,
                  maxHeight: sizeOf.width * 0.156 + 40,
                  child: Container(
                    color: AppColors.purple200,
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WalletAction(
                            title: 'Отправить',
                            icon: 'assets/icons/send.svg',
                            onTap: () {
                              context.push(RouteNames.walletSendCurrency);
                            },
                          ),
                          WalletAction(
                            title: 'Пополнить',
                            icon: 'assets/icons/get.svg',
                            onTap: () {
                              context.push(RouteNames.walletReplenish);
                            },
                          ),
                          WalletAction(
                            title: 'Купить',
                            icon: 'assets/icons/buy.svg',
                            onTap: () {
                              context.push(RouteNames.walletBuyCurrency);
                            },
                          ),
                          WalletAction(
                            title: 'Своп ',
                            icon: 'assets/icons/swap.svg',
                            onTap: () {
                              context.push(RouteNames.walletSwap);
                            },
                          ),
                        ],
                      ),
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
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16))),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Описание',
                        style: AppFonts.font16w400
                            .copyWith(color: AppColors.blackGraySecondary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Криптовалюта и платформа для создания децентрализованных онлайн-сервисов на базе блокчейна, работающих на базе умных контрактов. Реализована как единая децентрализованная виртуальная машина. Концепт был предложен Виталиком Бутериным в конце 2013 года, сеть была запущена 30 июля 2015 года',
                        style:
                            AppFonts.font14w400.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Описание',
                        style: AppFonts.font16w400
                            .copyWith(color: AppColors.blackGraySecondary),
                      ),
                      const SizedBox(height: 8,),
                      const Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 10,
                        children: [
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                          ButtonSocialMediaLink(text: "SEX"),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
