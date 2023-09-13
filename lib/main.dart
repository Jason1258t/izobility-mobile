import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/bloc_injector.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/auth/create_password.dart';
import 'package:izobility_mobile/feature/auth/enter_name.dart';
import 'package:izobility_mobile/feature/auth/enter_password.dart';
import 'package:izobility_mobile/feature/auth/create_pin_screen.dart';
import 'package:izobility_mobile/feature/auth/enter_pin_screen.dart';
import 'package:izobility_mobile/feature/auth/password_recovery.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/feature/profile/ui/profile.dart';
import 'package:izobility_mobile/feature/profile/ui/profile_edit.dart';
import 'package:izobility_mobile/feature/splash/splash.dart';
import 'package:izobility_mobile/utils/utils.dart';

import 'feature/auth/enter_email.dart';
import 'services/locale/export_locale_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = CustomBlocObserver();

  await dotenv.load();

  runApp(const MyRepositoryProviders(myApp: MyApp()));
}

final _router = GoRouter(
  initialLocation: RouteNames.root,
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
        path: RouteNames.authCreatePassword,
        builder: (context, state) => const CreatePasswordScreen()),
    GoRoute(
        path: RouteNames.authPasswordRecovery,
        builder: (context, state) => const PasswordRecoveryScreen()),
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
        path: RouteNames.profileEdit,
        builder: (context, state) => const ProfileEditScreen())
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      // initialRoute: RouteNames.root,
      // routes: {
      //   RouteNames.root: (context) => const SplashScreen(),
      //   RouteNames.home: (context) => const HomeScreen(),
      //   RouteNames.authCreateName: (context) => EnterNameScreen(),
      //   RouteNames.auth: (context) => EnterEmailScreen(),
      //   RouteNames.authEnterPin: (context) => const PinScreenEnter(),
      //   RouteNames.authCreatePassword: (context) => CreatePasswordScreen(),
      //   RouteNames.authEnterPassword: (context) => EnterPasswordScreen(),
      //   RouteNames.authCreatePin: (context) => const PinScreen()
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        //Navigator.popUntil(context, ModalRoute.withName(RouteNames.root));
        if (state is AppUnAuthState) return HomeScreen();
        if (state is CreatePinState) return const CreatePinScreen();
        if (state is EnterPinState) return const EnterPinScreen();
        if (state is AppAuthState) return const HomeScreen();
        return const SplashScreen();
      },
    );
  }
}
