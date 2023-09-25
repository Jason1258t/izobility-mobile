import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/auth/bloc/password_recovery/password_recovery_cubit.dart';
import 'package:izobility_mobile/feature/auth/data/auth_repository.dart';
import 'package:izobility_mobile/feature/games/bloc/games/games_cubit.dart';
import 'package:izobility_mobile/feature/games/data/games_repository.dart';
import 'package:izobility_mobile/feature/home/data/home_repository.dart';
import 'package:izobility_mobile/feature/main/bloc/main/main_screen_cubit.dart';
import 'package:izobility_mobile/feature/main/bloc/story/story_cubit.dart';
import 'package:izobility_mobile/feature/main/bloc/notifications/notifications_cubit.dart';
import 'package:izobility_mobile/feature/main/data/main_repository.dart';
import 'package:izobility_mobile/feature/main/data/notification_repository.dart';
import 'package:izobility_mobile/feature/profile/bloc/cubit/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/wallet/bloc/main_coin_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/main.dart';
import 'package:izobility_mobile/services/locale/export_locale_services.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';

import 'feature/auth/bloc/auth/auth_cubit.dart';

final PreferencesService prefs = PreferencesService();
final ApiService api = ApiService(preferencesService: prefs);


class MyBlocProviders extends StatelessWidget {
  const MyBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => AuthCubit(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => AppCubit(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => PasswordRecoveryCubit(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => StoryCubit(
            repository: RepositoryProvider.of<MainScreenRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => MainScreenCubit(
            repository: RepositoryProvider.of<MainScreenRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => NotificationsCubit(
            RepositoryProvider.of<NotificationsRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) =>
            GamesCubit(RepositoryProvider.of<GamesRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) =>
            ProfileCubit(RepositoryProvider.of<UserRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) =>
            MainCoinCubit(walletRepository: RepositoryProvider.of<WalletRepository>(context)),
        lazy: false,
      ),
    ], child: const MyApp());
  }
}

class MyRepositoryProviders extends StatelessWidget {
  const MyRepositoryProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
          create: (_) => AuthRepository(apiService: api, preferences: prefs)),
      RepositoryProvider(
        create: (_) => UserRepository(apiService: api, preferences: prefs),
      ),
      RepositoryProvider(
        create: (_) => HomeRepository(),
      ),
      RepositoryProvider(
        create: (_) => WalletRepository(api),
      ),
      RepositoryProvider(
        create: (_) => MainScreenRepository(),
      ),
      RepositoryProvider(
        create: (_) => GamesRepository(),
      ),
      RepositoryProvider(
          create: (context) =>
              NotificationsRepository(apiService: api, preferences: prefs))
    ], child: const MyBlocProviders());
  }
}
