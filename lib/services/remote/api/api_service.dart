import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:izobility_mobile/models/api/token.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:izobility_mobile/services/remote/constants/api_methods_url.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/logic/exceptions.dart';

part 'handler.dart';

part 'auth.dart';
part 'wallet.dart';

const Map<String, dynamic> _authHeaders = {
  'Content-Type': 'application/json',
};

BaseOptions dioOptions = BaseOptions(
  baseUrl: dotenv.get('BASE_SERVER_URL'),
  headers: _authHeaders,
  connectTimeout: const Duration(seconds: 15),
  receiveTimeout: const Duration(seconds: 20),
  sendTimeout: const Duration(seconds: 15),
);

class ApiService {
  final PreferencesService preferencesService;
  final Dio dio = Dio(dioOptions)..interceptors.add(PrettyDioLogger());

  late final Token token;
  late final Auth auth;
  late final Wallet wallet;

  ApiService({required this.preferencesService}) {
    initialServices();
  }

  void initialServices() async {
    token = await preferencesService.getToken() ?? Token.zero();
    wallet = Wallet(dio_: dio, preferences: preferencesService, token: token);
    auth = Auth(dio_: dio, preferences: preferencesService, token: token);
  }

  Future<void> logout() async {
    await preferencesService.logout();
  }
}
