import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:izobility_mobile/bloc_injector.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'services/locale/export_locale_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  StreamAuthNotifier notifier = StreamAuthNotifier();

  Bloc.observer = CustomBlocObserver(authNotifier: notifier);

  await dotenv.load();
  TrustWalletCoreLib.init();
  
  runApp(MyRepositoryProviders(
    notifier: notifier,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
