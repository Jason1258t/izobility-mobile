import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/profile/bloc/export.dart';
import 'package:izobility_mobile/feature/wallet/bloc/export.dart';
import 'package:izobility_mobile/feature/store/bloc/export.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/auth/bloc/password_recovery/password_recovery_cubit.dart';
import 'package:izobility_mobile/feature/auth/data/auth_repository.dart';
import 'package:izobility_mobile/feature/games/bloc/games/games_cubit.dart';
import 'package:izobility_mobile/feature/games/data/games_repository.dart';
import 'package:izobility_mobile/feature/main/bloc/main/main_screen_cubit.dart';
import 'package:izobility_mobile/feature/main/bloc/story/story_cubit.dart';
import 'package:izobility_mobile/feature/main/bloc/notifications/notifications_cubit.dart';
import 'package:izobility_mobile/feature/main/data/main_repository.dart';
import 'package:izobility_mobile/feature/main/data/notification_repository.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/burse_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/main.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/services/crypto/api_cripto.dart';
import 'package:izobility_mobile/services/locale/export_locale_services.dart';
import 'package:izobility_mobile/services/locale/locale_auth.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';

import 'feature/auth/bloc/auth/auth_cubit.dart';

final PreferencesService prefs = PreferencesService();
final ApiService api = ApiService(preferencesService: prefs);
final LocaleAuthService localeAuthService = LocaleAuthService();

class MyBlocProviders extends StatelessWidget {
  const MyBlocProviders(this.notifier, {super.key});

  final StreamAuthNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
        authRepository: RepositoryProvider.of<AuthRepository>(context),
        mainRepository: RepositoryProvider.of<MainScreenRepository>(context),
        walletRepository: RepositoryProvider.of<WalletRepository>(context),
        storeRepository: RepositoryProvider.of<StoreRepository>(context),
        burseRepository: RepositoryProvider.of<BurseRepository>(context));

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthCubit(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => appCubit,
            lazy: false,
          ),
          BlocProvider(
            create: (_) => PasswordRecoveryCubit(apiService: api),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => StoryCubit(
                repository:
                    RepositoryProvider.of<MainScreenRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => StoreCubit(
                storeRepository:
                    RepositoryProvider.of<StoreRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => ProfilePhoneChangeCubit(
                RepositoryProvider.of<UserRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => StoreItemCubit(
                storeRepository:
                    RepositoryProvider.of<StoreRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => MainScreenCubit(
                repository:
                    RepositoryProvider.of<MainScreenRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => NotificationsCubit(
                RepositoryProvider.of<NotificationsRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => PromoCodeCubit(
                apiService: api,
                walletRepository:
                    RepositoryProvider.of<WalletRepository>(context)),
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
            create: (_) => ProfileLinksCubit(),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => CoinInGameCubit(
                walletRepository:
                    RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => WalletAuthCubit(
                RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => CoinInWalletCubit(
                RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => BurseCreateOrderCubit(
                RepositoryProvider.of<BurseRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => BurseGeneralOrdersCubit(
                RepositoryProvider.of<BurseRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => CoinSendCubit(
                walletRepository:
                    RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => BurseBuyOrderCubit(
                RepositoryProvider.of<BurseRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => CoinsOnChainCubit(
                RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => BurseMyOrdersCubit(
                RepositoryProvider.of<BurseRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => CoinsInGameCubit(
                RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => SwapInGameCoinsCubit(
                walletRepository:
                    RepositoryProvider.of<WalletRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => ProfileReferralsCubit(
                RepositoryProvider.of<UserRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) =>
                StoreBuyCubit(RepositoryProvider.of<StoreRepository>(context)),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => StoreUserItemsCubit(
                RepositoryProvider.of<StoreRepository>(context)),
            lazy: false,
          ),
        ],
        child: StreamAuthScope(
          customNotifier: notifier,
          child: const MyApp(),
        ));
  }
}

class MyRepositoryProviders extends StatelessWidget {
  const MyRepositoryProviders({super.key, required this.notifier});

  final StreamAuthNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
          create: (_) => AuthRepository(
              apiService: api,
              preferences: prefs,
              localeAuthService: localeAuthService)),
      RepositoryProvider(
        create: (_) => UserRepository(apiService: api, preferences: prefs),
      ),
      RepositoryProvider(
        create: (_) => WalletRepository(
            apiService: api, prefs: prefs, apiCripto: ApiCripto()),
      ),
      RepositoryProvider(
        create: (_) => BurseRepository(apiService: api),
      ),
      RepositoryProvider(
        create: (_) => MainScreenRepository(apiService: api),
      ),
      RepositoryProvider(
        create: (_) => GamesRepository(),
      ),
      RepositoryProvider(
        create: (_) => StoreRepository(apiService: api),
      ),
      RepositoryProvider(
          create: (context) =>
              NotificationsRepository(apiService: api, preferences: prefs))
    ], child: MyBlocProviders(notifier));
  }
}
