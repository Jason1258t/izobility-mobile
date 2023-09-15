import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/main/data/notification_repository.dart';
import 'package:meta/meta.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository _notificationsRepository;

  NotificationsCubit(this._notificationsRepository)
      : super(NotificationsInitial());

  void loadNotifications({int page = 1}) async {
    emit(NotificationsWaitingState());
    await Future.delayed(const Duration(seconds: 3));
    try {
      await _notificationsRepository.loadNotificationList(page);
      emit(NotificationsLoadedSuccessState());
    } catch (e) {
      log(e.toString());
      emit(NotificationsLoadedFailureState());
      rethrow;
    }
  }
}
