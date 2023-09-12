import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:izobility_mobile/models/api/token.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:izobility_mobile/services/remote/api/endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'handler.dart';

part 'auth.dart';

const Map<String, dynamic> _authHeaders = {
  'Content-Type': 'application/x-www-form-urlencoded',
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
  final Dio dio = Dio()..interceptors.add(PrettyDioLogger());

  late final Auth auth;

  ApiService({required this.preferencesService}) {
    auth = Auth(dio_: dio, preferences: preferencesService);
  }

  Future<void> logout() async {
    await preferencesService.logout();
  }
}
