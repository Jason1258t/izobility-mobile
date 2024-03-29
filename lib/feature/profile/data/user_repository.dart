import 'package:izobility_mobile/models/referal.dart';
import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/models/user_details.dart';
import 'package:izobility_mobile/services/locale/preferences_service.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {
  UserRepository({required this.apiService, required this.preferences}) {}

  final ApiService apiService;
  final PreferencesService preferences;

  UserModel user = UserModel();
  Map<String, dynamic>? _userJson;

  List<ReferalModel> referralsList = [];

  BehaviorSubject<LoadingStateEnum> userDetailsDataStream =
      BehaviorSubject.seeded(LoadingStateEnum.wait);

  Future<void> loadUserDataFromCache() async {
    final cachedUser = await preferences.getUser();
    user = cachedUser!;
  }

  Future<Map<String, dynamic>> getUserJson() async {
    if (_userJson == null) {
      final Map<String, dynamic> response =
          await apiService.user.getUserDetailsInfo(userId: user.id!);

      _userJson = response;
    }

    return _buildUserJson();
  }

  Map<String, dynamic> _buildUserJson() {
    final Map<String, dynamic> r = {};
    r.addAll({
      "contact": _userJson!['email'],
      "score": 0.0,
      'jwt': apiService.getJwt()
    });
    print(r);
    r.addAll(_userJson!);
    r['id'] = int.parse(r['id']);
    r['date_registrated'] = r['created_at'];
    r['date_updated'] = r['updated_at'];
    print(r);
    return r;
  }

  Future<dynamic> loadUserDetailsInfo() async {
    userDetailsDataStream.add(LoadingStateEnum.loading);

    final UserModel? cachedUser = await preferences.getUser();

    if (cachedUser == null) {
      userDetailsDataStream.add(LoadingStateEnum.fail);
      return null;
    }
    try {
      final response =
          await apiService.user.getUserDetailsInfo(userId: cachedUser.id!);
      _userJson = response;
      final UserDetailsModel userDetails = UserDetailsModel.fromJson(response);

      user = cachedUser;
      user.details = userDetails;

      await preferences.setUser(user);

      userDetailsDataStream.add(LoadingStateEnum.success);
    } catch (ex) {
      print(ex);

      userDetailsDataStream.add(LoadingStateEnum.fail);
    }
  }

  void setLanguage(String countryCode) async {
    preferences.setLanguage(countryCode);
  }

  Future<String> getLanguage() async {
    return await preferences.getLanguage() ?? 'en';
  }

  Future<void> updateUserData({
    required String name,
    required String surname,
    required int gender,
    required String birthday,
    required String city,
    required String country,
  }) async {
    await apiService.user.updateUserData(
        name: name,
        surname: surname,
        gender: gender,
        birthday: birthday,
        city: city,
        country: country);
  }

  Future<dynamic> validateUserPhone(
      String countryCode, String phoneNumber) async {
    final response = await apiService.user
        .validateUserPhone(countryCode, phoneNumber, user.id!);
    return response;
  }

  Future<dynamic> validatePhoneCode(String code) async {
    await apiService.user.validatePhoneCode(code);
  }

  Future<dynamic> updatePhoto(String photoInBase64) async {
    await apiService.user.updatePhoto(photoInBase64);

    await loadUserDetailsInfo();
  }

  Future<dynamic> updateReferralCode(String referral) async {
    await apiService.user.updateReferalCode(referral);

    await loadUserDetailsInfo();
  }

  Future<dynamic> loadReferralsList() async {
    dynamic parseReferrals(ReferalModel referral) {
      referralsList.add(referral);

      for (var item in referral.referalList) {
        parseReferrals(item);
      }
    }

    referralsList.clear();

    final response = (await apiService.user.getReferalList())['objects'];
    final List<ReferalModel> parsedReferrals = [];

    for (var json in response) {
      try {
        parsedReferrals.add(ReferalModel.fromJson(json, 1));
      } catch (e) {
        print(e);
        print("$json HERE");
      }
    }

    for (var item in parsedReferrals) {
      parseReferrals(item);
    }
  }
}
