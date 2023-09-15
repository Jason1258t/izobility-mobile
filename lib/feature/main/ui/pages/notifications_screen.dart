import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/main/bloc/cubit/notifications_cubit.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/chip_category_card.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/chips_category_list.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/date_container.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_text_card.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_card_container.dart.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_coin_card.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notifications_date_sector.dart';
import 'package:izobility_mobile/models/notifications/notification_coin_model.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
import 'package:izobility_mobile/utils/constants.dart';
import 'package:izobility_mobile/utils/enum/notification_category.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:sliver_tools/sliver_tools.dart';

final notificationResponse = [
  NotificationCoinModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "АНАЛЬНАЯ ЗАРУБА",
      count: 5200,
      coinImagePath: 'assets/icons/coin.svg'),
  NotificationModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "бой с теньи",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the iscrambled"),
  NotificationCoinModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "РАСКОЛБАС",
      count: 5200,
      coinImagePath: 'assets/icons/coin.svg'),
  NotificationModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "ангри беурдс",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin"),
  NotificationModel(
      type: NotificationTransactionType.get,
      time: DateTime.now(),
      name: "ангри беурдс",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin"),
];

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<NotificationsCubit>().loadNotifications();

    super.initState();
    _scrollDown();
  }

  void _scrollDown() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients)
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        isBack: true,
        text: 'Уведомления',
        context: context,
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsWaitingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NotificationsLoadedSuccessState) {
            return Container(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              color: AppColors.purpleBcg,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: ChipsCategoryList(),
                  ),
                  NotificationsDateSector(
                    cards: notificationResponse,
                    date: DateTime.now(),
                  ),
                  NotificationsDateSector(
                    cards: notificationResponse,
                    date: DateTime.now(),
                  ),
                  NotificationsDateSector(
                    cards: notificationResponse,
                    date: DateTime.now(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'Sorry, something wetn wrong. Try again later',
                style: AppFonts.font20w700.copyWith(color: AppColors.darkBlue),
              ),
            );
          }
        },
      ),
    );
  }
}
