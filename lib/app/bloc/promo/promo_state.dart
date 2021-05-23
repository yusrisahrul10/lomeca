import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:equatable/equatable.dart';

abstract class PromoState extends Equatable {
  const PromoState();

  @override
  List<Object> get props => [];
}

class PromoInitial extends PromoState {}

class PromoLoading extends PromoState {}

class PromoLoaded extends PromoState {
  final dynamic promo;

  PromoLoaded({this.promo});

  @override
  List<Object> get props => [promo];
}

class PromoError extends PromoState {
  final String errorMessage;

  PromoError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}