import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/bloc_injector.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/splash/splash.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/utils.dart';

import 'services/locale/export_locale_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = CustomBlocObserver();

  await dotenv.load();

  runApp(const MyRepositoryProviders());
}

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
      routerConfig: CustomGoRoutes.router,
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AppCubit, AppState>(
//       listener: (context, state) {
//         if (state is AppUnAuthState) {
//           GoRouter.of(context).go(RouteNames.auth);
//         }
//         if (state is CreatePinState) {
//           GoRouter.of(context).go(RouteNames.authCreatePin);
//         }
//         if (state is EnterPinState) {
//           GoRouter.of(context).go(RouteNames.authEnterPin);
//         }
//         if (state is AppAuthState) {
//           log('Славик соси хуй');
//           return GoRouter.of(context).go(RouteNames.main);
//         }
//       },
//       child: const SplashScreen(),
//     );
//   }
// }
