import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/ui/create_password.dart';
import 'package:izobility_mobile/feature/auth/ui/create_pin_screen.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_email.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_name.dart';
import 'package:izobility_mobile/feature/auth/ui/enter_password.dart';
import 'package:izobility_mobile/feature/auth/ui/password_recovery_email.dart';
import 'package:izobility_mobile/feature/auth/ui/verify_recovery_code.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/feature/main/ui/pages/main_screen.dart';
import 'package:izobility_mobile/feature/main/ui/pages/notifications_screen.dart';
import 'package:izobility_mobile/feature/main/ui/pages/story_screen.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile_about.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile_edit.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/buy_currency_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/choose_coin_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/crypto_wallet_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/currency_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/replenish_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/send_currence_screen.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/swap_screen.dart';
import 'package:izobility_mobile/main.dart';
import 'package:izobility_mobile/routes/route_names.dart';

import '../feature/profile/ui/pages/profile_settings.dart';

class CustomGoRoutes{
  static final defaultKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RouteNames.root,
    navigatorKey: defaultKey,
    routes: [
      GoRoute(
        path: RouteNames.root,
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: RouteNames.auth,
        builder: (context, state) => EnterEmailScreen(),
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
          path: '${RouteNames.authCreatePasswordBaseLink}/:variant',
          builder: (context, state) =>
              CreatePasswordScreen(
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
          path: RouteNames.story,
          builder: (context, state) => const StoryScreen()),
      GoRoute(
          path: RouteNames.walletCurrency,
          builder: (context, state) => const CurrencyWalletScreen()),
      GoRoute(
          path: RouteNames.walletSwap,
          builder: (context, state) => const SwopScreen()),
      GoRoute(
          path: RouteNames.walletSendCurrency,
          builder: (context, state) => const SendCurrencyScreen()),
      GoRoute(
          path: RouteNames.walletReplenish,
          builder: (context, state) => const ReplenishScreen()),
      GoRoute(
        path: '${RouteNames.walletChooseCoin}/:screen',
        builder: (context, state) => ChooseCoinScreen(path: state.pathParameters['screen'] ?? '',),
      ),
      GoRoute(
          path: RouteNames.walletBuyCurrency,
          builder: (context, state) => const BuyCurrencyScreen()),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return HomeScreen(body: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.main,
            pageBuilder: (context, state) =>
                CustomTransitionPage<void>(
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
            pageBuilder: (context, state) =>
                CustomTransitionPage<void>(
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
            path: RouteNames.gameMarket,
            pageBuilder: (context, state) =>
                CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: const Text('GameMarket'),
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
            pageBuilder: (context, state) =>
                CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: const Text('Basket'),
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
            pageBuilder: (context, state) =>
                CustomTransitionPage<void>(
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