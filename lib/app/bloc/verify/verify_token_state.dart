import 'package:ancol_taking_order/app/models/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class VerifyTokenState extends Equatable {
  const VerifyTokenState();

  @override
  List<Object> get props => [];
}

class VerifyTokenInitial extends VerifyTokenState {}

class VerifyTokenLoading extends VerifyTokenState {}

class VerifyTokenRequestSuccess extends VerifyTokenState {
  final dynamic register;

  VerifyTokenRequestSuccess({this.register});

  @override
  List<Object> get props => [register];
}

class VerifyTokenFailure extends VerifyTokenState {
  final String error;

  const VerifyTokenFailure({@required this.error});

  @override
  List<Object> get props => [error];
}