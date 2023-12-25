import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocaleAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> canLocalAuth() async =>
      await _localAuth.canCheckBiometrics ||
          await _localAuth.isDeviceSupported();

  Future localAuthenticate() async {
    if (await canLocalAuth()) {
      final bool didAuthenticate = await _localAuth.authenticate(
          localizedReason: 'Подтвердите свою личность',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Вход в Emerald',
              biometricHint: '',
              cancelButton: 'Отмена',
            ),
            IOSAuthMessages(
              cancelButton: 'Отмена',
            ),
          ],
          options: const AuthenticationOptions(biometricOnly: true));

      return didAuthenticate;
    }
  }
}