import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/ui/create_password.dart';
import 'package:izobility_mobile/feature/auth/ui/create_pin_screen.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_email.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_name.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_password.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_pin_screen.dart';
import 'package:izobility_mobile/feature/auth/ui/password_recovery_email.dart';
import 'package:izobility_mobile/feature/auth/ui/verify_recovery_code.dart';
import 'package:izobility_mobile/feature/cards/ui/pages/cards_screen.dart';
import 'package:izobility_mobile/feature/cards/ui/pages/cards_add_screen.dart';
import 'package:izobility_mobile/feature/games/ui/pages/games_details_screen.dart';
import 'package:izobility_mobile/feature/games/ui/pages/games_loading_screen.dart';
import 'package:izobility_mobile/feature/games/ui/pages/games_screen.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/feature/main/ui/pages/main_screen.dart';
import 'package:izobility_mobile/feature/main/ui/pages/notifications_screen.dart';
import 'package:izobility_mobile/feature/main/ui/pages/story_screen.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile_about.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile_edit.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile_inventory.dart';
import 'package:izobility_mobile/feature/splash/splash.dart';
import 'package:izobility_mobile/feature/store/ui/pages/store_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/buy_currency_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/choose_coin_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/currency_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/info_currency_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/replenish_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/send_currence_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/swap_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/wallet_screen.dart';
import 'package:izobility_mobile/main.dart';
import 'package:izobility_mobile/widgets/screens/develop_screen.dart';

import '../feature/auth/bloc/app/app_cubit.dart';
import '../feature/profile/ui/pages/profile_settings.dart';

part 'main_routes.dart';

part 'auth_routes.dart';

part 'route_names.dart';

part 'stream_auth_scope.dart';

class CustomGoRoutes {
  static final defaultKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RouteNames.splash,
    navigatorKey: defaultKey,
    redirect: (BuildContext context, GoRouterState state) async {
      final AppState appState = StreamAuthNotifier.of(context) ?? AppInitial();

      print(appState);

      bool containsRout(String route) {
        for (String defaultRoute in mainRoutesNames) {
          if (route.startsWith(defaultRoute)) return true;
        }
        return false;
      }

      if (appState is AppAuthState && !containsRout(state.matchedLocation)) {
        return RouteNames.main;
      }
      if (appState is CreatePinState) {
        return RouteNames.authCreatePin;
      }

      if (appState is EnterPinState) {
        return RouteNames.authEnterPin;
      }

      // log(state.matchedLocation.toString());
      // log((appState is AppUnAuthState &&
      //         !authRoutes.contains(state.matchedLocation))
      //     .toString());

      if (appState is AppUnAuthState &&
          !authRoutes.contains(state.matchedLocation)) {
        return RouteNames.auth;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.develop,
        builder: (context, state) => DevelopingScreen(),
      ),
      GoRoute(
        path: RouteNames.auth,
        builder: (context, state) => const EnterEmailScreen(),
      ),
      GoRoute(
        path: RouteNames.cardsAdd,
        builder: (context, state) => const CardsAddScreen(),
      ),
      GoRoute(
          path: RouteNames.authCreateName,
          builder: (context, state) => const EnterNameScreen()),
      GoRoute(
          path: RouteNames.authEnterPassword,
          builder: (context, state) => const EnterPasswordScreen()),
      GoRoute(
          path: RouteNames.authCreatePin,
          builder: (context, state) => const CreatePinScreen()),
      GoRoute(
          path: RouteNames.authEnterPin,
          builder: (context, state) => const EnterPinScreen()),
      GoRoute(
          path: '${RouteNames.authCreatePasswordBaseLink}/:variant',
          builder: (context, state) => CreatePasswordScreen(
                creatingVariant: state.pathParameters['variant'] ?? '',
              )),
      GoRoute(
          path: RouteNames.authPasswordRecoveryEmail,
          builder: (context, state) => const PasswordRecoveryEmailScreen()),
      GoRoute(
          path: RouteNames.authPasswordRecoveryVerifyCode,
          builder: (context, state) => const VerifyRecoveryCodeScreen()),
      GoRoute(
          path: RouteNames.profileEdit,
          builder: (context, state) => const ProfileEditScreen()),
      GoRoute(
          path: RouteNames.profileSettings,
          builder: (context, state) => const ProfileSettingsScreen()),
      GoRoute(
          path: RouteNames.profileAbout,
          builder: (context, state) => const ProfileAppAboutScreen()),
      GoRoute(
          path: RouteNames.notifications,
          builder: (context, state) => const NotificationsScreen()),
      GoRoute(
          path: '${RouteNames.story}/:story_id',
          builder: (context, state) => StoryScreen(
                initialStoryIndex:
                    int.parse(state.pathParameters['story_id'] ?? 0 as String),
              )),
      GoRoute(
          path: RouteNames.walletCurrency,
          builder: (context, state) => const CurrencyWalletScreen()),
      GoRoute(
          path: RouteNames.walletInfoCurrency,
          builder: (context, state) => const InfoCurrencyWalletScreen()),
      GoRoute(
          path: RouteNames.walletSwap,
          builder: (context, state) => const SwapScreen()),
      GoRoute(
          path: RouteNames.walletSendCurrency,
          builder: (context, state) => const SendCurrencyScreen()),
      GoRoute(
          path: RouteNames.walletReplenish,
          builder: (context, state) => const ReplenishScreen()),
      GoRoute(
        path: '${RouteNames.walletChooseCoin}/:screen',
        builder: (context, state) => ChooseCoinScreen(
          path: state.pathParameters['screen'] ?? '',
        ),
      ),
      GoRoute(
          path: RouteNames.walletBuyCurrency,
          builder: (context, state) => const BuyCurrencyScreen()),
      GoRoute(
          path: RouteNames.cards,
          builder: (context, state) => const CardsScreen()),
      GoRoute(
        path: RouteNames.gamesDetails,
        builder: (context, state) => GamesDetailsScreen(
          gameId: state.pathParameters['game_id'] ?? '0',
        ),
      ),
      GoRoute(
          path: RouteNames.gamesDetailsLoading,
          builder: (context, state) => const GamesLoadingScreen()),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return HomeScreen(body: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.main,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const MainScreen(),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return child;
              },
            ),
          ),
          GoRoute(
            path: RouteNames.wallet,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const WalletScreen(),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return child;
              },
            ),
          ),
          GoRoute(
            path: RouteNames.games,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const GamesScreen(),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return child;
              },
            ),
          ),
          GoRoute(
            path: RouteNames.basket,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const StoreScreen(),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return child;
              },
            ),
          ),
          GoRoute(
            path: RouteNames.profile,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const ProfileScreen(),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return child;
              },
            ),
          ),
        ],
      ),
    ],
  );
}
