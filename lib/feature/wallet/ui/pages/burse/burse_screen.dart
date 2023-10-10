import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/burse_general_orders/burse_general_orders_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/order_item.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';

class BurseScreen extends StatefulWidget {
  const BurseScreen({super.key});

  @override
  State<BurseScreen> createState() => _BurseScreenState();
}

class _BurseScreenState extends State<BurseScreen>
    with SingleTickerProviderStateMixin {
  int isBurseOrMyOrder = 0;

  late TabController _tabController;

  @override
  void initState() {
    context.read<WalletRepository>().getBurseGeneralItemList(10, 1);

    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = isBurseOrMyOrder;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final walletRepository = RepositoryProvider.of<WalletRepository>(context);

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: AppColors.purpleBcg,
        appBar: CustomAppBar(
          context: context,
          text: "Биржа",
          actions: [
            InkWell(
              onTap: () {
                context.push(RouteNames.walletBurseBuyOrder);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 18),
                child: Icon(
                  Icons.history,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            )
          ],
          isBack: true,
          onTap: () {
            context.pop();
          },
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: SliverAppBarDelegate(
                minHeight: 115,
                maxHeight: 115,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://assets.coingecko.com/coins/images/2655/large/emd.png?1644748192'))),
                        ),
                      ),
                      Text(
                          walletRepository.obscured
                              ? AppStrings.obscuredText
                              : walletRepository.emeraldInGameBalance
                                  .toString(),
                          style: AppTypography.font36w700
                              .copyWith(color: AppColors.textPrimary)),
                    ],
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverAppBarDelegate(
                minHeight: 55,
                maxHeight: 55,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.white,
                    child: CustomButton(
                      text: 'Создать свой заказ',
                      onTap: () {
                        context.push(RouteNames.walletBurseCreateOrder);
                      },
                      width: double.infinity,
                    )),
              ),
            ),
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: SliverAppBarDelegate(
                minHeight: 17,
                maxHeight: 17,
                child: Container(
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16))),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverAppBarDelegate(
                minHeight: 60,
                maxHeight: 60,
                child: Container(
                  color: AppColors.purpleBcg,
                  alignment: Alignment.center,
                  child: TabBar(
                    labelColor: AppColors.textPrimary,
                    indicatorColor: AppColors.textPrimary,
                    indicatorWeight: 2,
                    indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: AppColors.textPrimary, width: 2),
                        insets: EdgeInsets.symmetric(horizontal: -40)),
                    onTap: (int val) {
                      setState(() {
                        isBurseOrMyOrder = val;
                      });
                    },
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Биржа',
                      ),
                      Tab(text: 'Мои заказы'),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
                        .copyWith(bottom: 0),
                sliver: isBurseOrMyOrder == 0
                    ? SliverList(
                        delegate: SliverChildListDelegate([
                          BlocBuilder<BurseGeneralOrdersCubit,
                              BurseGeneralOrdersState>(
                            builder: (contex, state) {
                              if (state is BurseGeneralOrdersSuccess) {
                                return Column(
                                  children: walletRepository.ordersGeneralList
                                      .map((currentOrder) => OrderItem(
                                          order: currentOrder,
                                          ))
                                      .toList(),
                                );
                              } else if (state is BurseGeneralOrdersLoading) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }

                              return Container();
                            },
                          )
                        ]),
                      )
                    : const SliverToBoxAdapter(
                        child: Text(
                          'Еще нету контрактов',
                          textAlign: TextAlign.center,
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
