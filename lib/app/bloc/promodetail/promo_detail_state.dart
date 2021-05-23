import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:equatable/equatable.dart';

abstract class PromoDetailState extends Equatable {
  const PromoDetailState();

  @override
  List<Object> get props => [];
}

class PromoDetailInitial extends PromoDetailState {}

class PromoDetailLoading extends PromoDetailState {}

class PromoDetailLoaded extends PromoDetailState {
  final dynamic promo;

  PromoDetailLoaded({this.promo});

  @override
  List<Object> get props => [promo];
}

class PromoDetailError extends PromoDetailState {
  final String errorMessage;

  PromoDetailError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}