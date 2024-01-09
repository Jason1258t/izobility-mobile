import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/burse_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/order_item.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BurseHistoryScreen extends StatefulWidget {
  const BurseHistoryScreen({super.key});

  @override
  State<BurseHistoryScreen> createState() => _BurseHistoryScreenState();
}

class _BurseHistoryScreenState extends State<BurseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final burseRepository = RepositoryProvider.of<BurseRepository>(context);
    final localize = AppLocalizations.of(context)!;
    return WalletScaffold(
      onTap: () {},
      backgroundColor: Colors.white,
      scaffoldColor: AppColors.purpleBcg,
      appBar: CustomAppBar(
        context: context,
        text: localize.buying_order,
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: MultiSliver(
                  children: List.generate(
                9,
                (index) => MultiSliver(
                  pushPinnedChildren: true,
                  children: [
                    SliverPinnedHeader(
                        child: Container(
                      padding: const EdgeInsets.all(5),
                      color: AppColors.purpleBcg,
                      child: Text(
                        "${DateTime.now().day} ${AppStrings.months[(DateTime.now().month - index).toString()]}",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    SliverToBoxAdapter(
                      child: Column(
                        children: burseRepository.ordersGeneralList
                            .map((currentOrder) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: OrderItem(
                                    type: BurseOrderType.general,
                                    order: currentOrder,
                                    onTap: () {},
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )),
            )
          ]),
    );
  }
}
