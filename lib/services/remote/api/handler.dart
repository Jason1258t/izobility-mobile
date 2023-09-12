part of 'api_service.dart';

mixin class ApiHandler {
  late final Dio dio;
  late final PreferencesService preferencesService;

  _errorHandler(Future<Response> method, String url) async {
    try {
      final res = await method;
      return res.data;
    } catch (e) {
      log(url);
      rethrow;
    }
  }

  Future get(String url) async {
    return _errorHandler(dio.get(url), url);
  }

  Future post(String url,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return _errorHandler(
        dio.post(url, data: data, queryParameters: queryParameters), url);
  }

  Future delete(String url) async {
    try {
      final res = await dio.delete(url);
      return res.data;
    } catch (e) {
        log(url);
        rethrow;
      }
    }

  Future<void> refreshToken() async {
    final res = await get(ApiEndpoints.refreshEndpoint);

    final token = Token.fromJson(res);

    preferencesService.saveToken(token);
    dio.options.headers = {};
  }
}
