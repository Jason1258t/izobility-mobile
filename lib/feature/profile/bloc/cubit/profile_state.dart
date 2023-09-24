part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileWaiting extends ProfileState {}

final class ProfileSuccessState extends ProfileState {}

final class ProfilefailureState extends ProfileState {}
