abstract class RouteNames {
  static const root = '/';

  static const String home = "/home";

  static const String auth = "/auth";

  static const String authCreatePasswordBaseLink = '/auth/password_create';

  static const String authCreatePassword = "/auth/password_create/create";
  static const String authCreatePin = "/auth/pin_create";
  static const String authCreateName = "/auth/name_create";

  static const String authEnterPassword = "/auth/password_enter";
  static const String authEnterPin = "/auth/pin_enter";

  static const String authPasswordRecoveryEmail =
      '/auth/password_recovery_email';
  static const String authPasswordRecoveryVerifyCode =
      '/auth/password_recovery_verify';
  static const String authPasswordRecoveryChangePassword =
      '/auth/password_create/change';

  static const String wallet = '/wallet';

  static const String walletCurrency = '/wallet/currency';
  static const String walletSwop = '/wallet/swop';

  static const String profile = '/profile';

  static const String profileEdit = '/profile/edit';
  static const String profileInventory = '/profile/inventory';
  static const String profileSettings = '/profile/settings';
  static const String profileAbout = '/profile/about';

  static const String notifications = '/notifications';

  static const String story = '/story';
}
