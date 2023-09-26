import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/models/user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;

  ProfileCubit(this._userRepository) : super(ProfileInitial());

  Future<void> logout() async {
    emit(ProfileWaiting());

    try {
      await _userRepository.preferences.logout();
      emit(ProfileSuccessState());
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> loadUserCachedData() async {
    emit(ProfileWaiting());
    await _userRepository.loadUserData();
    emit(ProfileSuccessState());
  }

  Future<void> laodUserDetailsInfo() async {
    emit(ProfileWaiting());
    await _userRepository.loadUserDetailsInfo();
    try {
      emit(ProfileSuccessState());
    } catch (ex) {
      print(ex);
      emit(ProfilefailureState());
    }
  }
}
