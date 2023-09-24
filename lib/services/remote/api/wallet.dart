part of 'api_service.dart';

class Wallet with ApiHandler {
  Wallet(
      {required Dio dio_,
        required PreferencesService preferences,
        required Token token}) {
    preferencesService = preferences;
    dio = dio_;
    currentToken = token;
  }

  Future<dynamic> getEmeraldCoin() async {
    print(dio.options.headers);
    print('a---------------------------');

    return (await dio.get(ApiMethodsUrl.wallet)).data;
  }
}
