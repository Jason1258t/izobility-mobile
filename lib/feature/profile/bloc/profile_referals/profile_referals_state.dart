part of 'profile_referals_cubit.dart';

@immutable
sealed class ProfileReferralsState {}

final class ProfileReferalsInitial extends ProfileReferralsState {}

final class ProfileReferalsLoading extends ProfileReferralsState {}


final class ProfileReferalsFailure extends ProfileReferralsState {}


final class ProfileReferalsSuccess extends ProfileReferralsState {}

