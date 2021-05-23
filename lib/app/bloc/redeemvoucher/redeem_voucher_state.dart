import 'package:ancol_taking_order/app/models/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class RedeemVoucherState extends Equatable {
  const RedeemVoucherState();

  @override
  List<Object> get props => [];
}

class RedeemVoucherInitial extends RedeemVoucherState {}

class RedeemVoucherLoading extends RedeemVoucherState {}

class RedeemVoucherRequestSuccess extends RedeemVoucherState {
  final dynamic redeem;

  RedeemVoucherRequestSuccess({this.redeem});

  @override
  List<Object> get props => [redeem];
}

class RedeemVoucherFailure extends RedeemVoucherState {
  final String error;

  const RedeemVoucherFailure({@required this.error});

  @override
  List<Object> get props => [error];
}