import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/auth/data/auth_repository.dart';
import 'package:izobility_mobile/services/locale/export_locale_services.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/auth/bloc/auth/auth_cubit.dart';

final PreferencesService prefs = PreferencesService();
final ApiService api = ApiService(preferencesService: prefs);

class MyBlocProviders extends StatelessWidget {
  MyBlocProviders({super.key, required this.myApp});

  Widget myApp;

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
    ], child: myApp);
  }
}

class MyRepositoryProviders extends StatelessWidget {
  MyRepositoryProviders({super.key, required this.myApp});

  Widget myApp;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => AuthRepository(apiService: api))
        ],
        child: MyBlocProviders(
          myApp: myApp,
        ));
  }
}
