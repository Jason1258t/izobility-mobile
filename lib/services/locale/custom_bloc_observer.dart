// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/routes/go_routes.dart';

class CustomBlocObserver extends BlocObserver {
  CustomBlocObserver({required this.authNotifier});

  final StreamAuthNotifier authNotifier;

  @override
  void onCreate(bloc) {
    log('***$bloc***', name: '-------------------- onCreate BLoC');
    super.onCreate(bloc);
  }

  @override
  void onClose(bloc) {
    log('***$bloc***', name: '-------------------- onClose BLoC');
    super.onClose(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('*** bloc = $bloc*** *** event = $event***',
        name: '-------------------- onEvent BLoC');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(bloc, Change change) {
    log('*** bloc = $bloc*** *** change = $change***',
        name: '-------------------- onChange BLoC');

    if (bloc is AppCubit) {
      authNotifier.notify(
          message: change.nextState.toString(), state: change.nextState);
    }

    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('*** bloc = $bloc*** *** transition = $transition***',
        name: '-------------------- onTransition BLoC');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(bloc, Object error, StackTrace stackTrace) async {
    log('--------------------');
    log('*** $bloc ***');
    log('!!!!!! Error: $error ');
    log('!!!!!! StackTrace: $stackTrace');
    log('--------------------');

    super.onError(bloc, error, stackTrace);
  }
}
