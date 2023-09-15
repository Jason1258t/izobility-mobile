import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/main/bloc/cubit/notifications_cubit.dart';
import 'package:izobility_mobile/feature/main/data/notification_repository.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/chips_category_list.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notifications_date_sector.dart';
import 'package:izobility_mobile/models/notifications/notification_coin_model.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
import 'package:izobility_mobile/utils/enum/notification_category.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

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
      body: Container(
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        color: AppColors.purpleBcg,
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            final data =
                context.read<NotificationsRepository>().notificationList;

            if (state is NotificationsWaitingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NotificationsLoadedSuccessState) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: ChipsCategoryList(),
                  ),
                  NotificationsDateSector(
                    cards: data,
                    date: DateTime.now(),
                  ),
                  NotificationsDateSector(
                    cards: data,
                    date: DateTime.now(),
                  ),
                  NotificationsDateSector(
                    cards: data,
                    date: DateTime.now(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Text(
                  'Sorry, something wetn wrong. Try again later',
                  style:
                      AppFonts.font20w700.copyWith(color: AppColors.darkBlue),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}