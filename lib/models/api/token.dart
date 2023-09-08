import 'package:izobility_mobile/utils/constants.dart';

class Token {
  final String accessToken;
  final String refreshToken;
  final String accessTokenExpired;
  final String refreshTokenExpired;

  Token.fromJson(Map<String, dynamic> json)
      : accessToken = json[''],
        refreshToken = json[''],
        accessTokenExpired = json[''],
        refreshTokenExpired = json[''];

  Token(
      {required this.accessToken,
      required this.accessTokenExpired,
      required this.refreshToken,
      required this.refreshTokenExpired});

  bool get accessExpired {
    DateTime expiredTime = DateTime.parse(accessTokenExpired);
    expiredTime = expiredTime.add(serverOffset);

    final Duration difference = DateTime.now().difference(expiredTime);

    return difference.inMinutes >= -1;
  }

  bool get refreshExpired {
    DateTime expiredTime = DateTime.parse(refreshTokenExpired);
    expiredTime = expiredTime.add(serverOffset);

    final Duration difference = DateTime.now().difference(expiredTime);

    return difference.inMinutes >= -1;
  }
}
