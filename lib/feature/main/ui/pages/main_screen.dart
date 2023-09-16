import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/containers/cash_container.dart';
import 'package:izobility_mobile/widgets/containers/market_Item.dart';
import 'package:izobility_mobile/widgets/containers/utility_container.dart';
import 'package:izobility_mobile/widgets/indicators/notifications_indicator.dart';

import '../../../../widgets/containers/guides_suggestion.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.purpleBcg,
        appBar: AppBar(
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/top page navigation.svg',
                width: MediaQuery.sizeOf(context).width / 3.6,
              ),
              const Spacer(),
              const CashContainer(
                  text: '150K', assetName: 'assets/images/Coins.png'),
              const SizedBox(
                width: 12,
              ),
              const NotificationsIndicator()
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UtilityContainer(
                            name: 'QR\nСканер',
                            assetName: 'assets/icons/qrscaner.svg',
                            callback: () {}),
                        UtilityContainer(
                            name: 'AR\nСканер',
                            assetName: 'assets/icons/aritem.svg',
                            callback: () {}),
                        UtilityContainer(
                            name: 'AR\nКарта',
                            assetName: 'assets/icons/armap.svg',
                            callback: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Ink(
                        width: double.infinity,
                        height: 120,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        //constraints: const BoxConstraints(minHeight: 120),
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/test_banner.jpg'),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Играй и зарабатывай',
                              style: AppFonts.font20w700,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: Text(
                                'Игры в дополненной реальности',
                                style: AppFonts.font14w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 1,
                      color: AppColors.disableButton,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width - 32,
                        height: 102,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (ctx, ind) => GuidesSuggestion(
                                  text: 'Где искать клиентов',
                                  imageUrl: 'assets/images/img.jpg',
                                  onTap: () {
                                    context.push(RouteNames.story);
                                  },
                                  viewed: true,
                                )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Магазин',
                          style:
                              AppFonts.font24w700.copyWith(color: Colors.black),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.only(
                                left: 18, top: 6, bottom: 6),
                            child: Text(
                              'Ещё',
                              style: AppFonts.font12w400
                                  .copyWith(color: AppColors.disable),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
