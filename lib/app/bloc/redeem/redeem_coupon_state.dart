import 'package:equatable/equatable.dart';

abstract class RedeemCouponState extends Equatable {
  const RedeemCouponState();

  @override
  List<Object> get props => [];
}

class RedeemCouponInitial extends RedeemCouponState {}

class RedeemCouponLoading extends RedeemCouponState {}

class RedeemCouponLoaded extends RedeemCouponState {
  final dynamic data;

  RedeemCouponLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class RedeemCouponError extends RedeemCouponState {
  final String errorMessage;

  RedeemCouponError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}