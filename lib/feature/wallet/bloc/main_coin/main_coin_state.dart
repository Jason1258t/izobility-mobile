part of 'main_coin_cubit.dart';

@immutable
abstract class MainCoinState {}

class MainCoinInitial extends MainCoinState {}

class MainCoinLoading extends MainCoinState {}

class MainCoinFail extends MainCoinState {}

class MainCoinSuccess extends MainCoinState {}
