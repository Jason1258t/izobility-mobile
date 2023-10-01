import 'dart:convert';

import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/models/user_details.dart';
import 'package:izobility_mobile/models/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/api/token.dart';

class PreferencesService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  // static const String _accessExpiredKey = 'accessExpired';
  // static const String _refreshExpiredKey = 'refreshExpired';

  static const String pinKey = 'pinCode';

  static const String _userKey = 'user';

  static const String _seedPhrase = 'seedPhrase';

  static const String _wallet = 'wallet';

  Future saveToken(Token token) async {
    final prefs = await _prefs;

    prefs.setString(_accessTokenKey, token.accessToken!);
    prefs.setString(_refreshTokenKey, token.refreshToken ?? '');
    // prefs.setString(_accessExpiredKey, token.accessTokenExpired!);
    // prefs.setString(_refreshExpiredKey, token.refreshTokenExpired!);
  }

  Future<Token?> getToken() async {
    final prefs = await _prefs;

    final accessToken = prefs.getString(_accessTokenKey);
    // final accessTokenExpired = prefs.getString(_accessExpiredKey);
    final refreshToken = prefs.getString(_refreshTokenKey);
    // final refreshTokenExpired = prefs.getString(_refreshExpiredKey);

    try {
      return Token(
          accessToken: accessToken,
          // accessTokenExpired: accessTokenExpired,
          refreshToken: refreshToken);
      // refreshTokenExpired: refreshTokenExpired);
    } catch (e) {
      return null;
    }
  }

  Future setPin(String pin) async {
    final prefs = await _prefs;
    prefs.setString(pinKey, pin);
  }

  Future<String?> getPin() async {
    final prefs = await _prefs;
    return prefs.getString(pinKey);
  }

  Future<void> setUser(UserModel rawUser) async {
    final prefs = await _prefs;
    final String user = jsonEncode(rawUser.toJson());
    prefs.setString(_userKey, user);
  }

  Future<UserModel?> getUser() async {
    final prefs = await _prefs;
    final rawUser = prefs.getString(_userKey);
    if (rawUser == null) {
      return null;
    }
    print('-------------');
    print(rawUser);
    print('-----------');
    final UserModel user = UserModel.fromJson(jsonDecode(rawUser));
    return user;
  }

  Future<void> clearWallet() async {
    final prefs = await _prefs;
    prefs.remove(_wallet);
  }

  Future<void> setWalletData(WalletModel wallet) async {
    final prefs = await _prefs;

    final walletString = jsonEncode(wallet.toJson());
    prefs.setString(_wallet, walletString);
  }

  Future<WalletModel?> getWallet() async {
    final prefs = await _prefs;

    final walletString = prefs.getString(_wallet);
    if (walletString == null) {
      return null;
    }

    final wallet = WalletModel.fromJson(jsonDecode(walletString));
    return wallet;
  }

  Future logout() async => (await _prefs).clear();
}
