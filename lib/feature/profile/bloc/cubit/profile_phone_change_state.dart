part of 'profile_phone_change_cubit.dart';

@immutable
sealed class ProfilePhoneChangeState {}

final class ProfilePhoneChangeInitial extends ProfilePhoneChangeState {}

final class ProfilePhoneChangeLoading extends ProfilePhoneChangeState {}

final class ProfilePhoneChangeFailure extends ProfilePhoneChangeState {
  final String errorText;

  ProfilePhoneChangeFailure({required this.errorText});
}

final class ProfilePhoneChangeSuccess extends ProfilePhoneChangeState {}
