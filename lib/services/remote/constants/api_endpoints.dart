class ApiEndpoints {
  static const String register = "/user/registration";

  static const String confirmRegister = '/user/registration-confirm';

  static const String login = '/user/login';
  static const String refresh = '/user/login-token';

  static const String resendCode = '/user/registration-resend';

  static const String wallet = '/balance/balance';
  static const String userGameTokens = '/wallet/list';

  static const String userInfo = '/user/';
  static const String userUpdateName = '/user/update-fio';
  static const String userUpdatePhoto = '/user/update-photo';
  static const String userUpdatePhone = '/user/update-phone';
  static const String userUpdateBirthday = '/user/update-birth';
  static const String userUpdateGender = '/user/update-gender';

  static const String userValidatePhone = '/user/update-phone';
  static const String userValiddatePhoneCode = '/user/update-phone-confirm';

  static const String mediaFiles = '/media';

  static const String newsList = '/news/list';

  static const String getNotifications = '/user/notifications';

  static const String usePromoCode = '/code/use';
  static const String productsList = '/product/list';
  static const String productItemInfo = '/product/view/';

  static const String walletSwapInGameToOnChain = "/wallet/transfer";
  static const String walletSwapOnChainToInGame = '/wallet/return';
  static const String walletTokenList = '/wallet/tokens-balance';

  static const String burseOrdersList = '/trade/list';
  static const String burseCreateOrder = '/trade/add-order';
  static const String burseBuyOrder = '/trade/buy-order';
  static const String burseCancelOrder = '/trade/cancel-order';
}
