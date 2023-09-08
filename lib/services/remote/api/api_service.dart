import 'dart:developer';

import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'handler.dart';

class ApiService {
  ApiService({required PreferencesService preferencesService});
}