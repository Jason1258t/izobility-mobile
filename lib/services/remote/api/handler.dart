part of 'api_service.dart';

mixin class ApiHandler {
  late final Dio dio;
  late final PreferencesService preferencesService;
  late final Token currentToken;

  _errorHandler(Future<Response> method, String url) async {
    try {
      // if (currentToken.accessExpired) {
      //   if (currentToken.refreshExpired) throw UnAuthenticatedException;
      //   await refreshToken();
      // }

      final res = await method;
      return res.data;
    } catch (e) {
      log(url);
      rethrow;
    }
  }

  Future get(String url, {Map<String, dynamic>? queryParameters}) async {
    return _errorHandler(dio.get(url, queryParameters: queryParameters), url);
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

  Future<void> refreshToken(String jwt) async {
    Token token = Token(accessToken: jwt, refreshToken: null);

    preferencesService.saveToken(token);

    currentToken.accessToken = token.accessToken;
    currentToken.refreshToken = token.refreshToken;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': currentToken.accessToken
    };
  }
}
