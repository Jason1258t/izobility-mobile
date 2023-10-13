part of 'promo_code_cubit.dart';

@immutable
abstract class PromoCodeState {}

class PromoCodeInitial extends PromoCodeState {}

class PromoActivateProcessState extends PromoCodeState {}

class PromoInvalidState extends PromoCodeState {}

class PromoActivatedState extends PromoCodeState {
  final String coinName;

  PromoActivatedState({required this.coinName});
}
