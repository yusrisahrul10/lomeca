import 'package:ancol_taking_order/app/models/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LoginMemberState extends Equatable {
  const LoginMemberState();

  @override
  List<Object> get props => [];
}

class LoginMemberInitial extends LoginMemberState {}

class LoginMemberLoading extends LoginMemberState {}

class LoginMemberRequestSuccess extends LoginMemberState {
  final dynamic login;

  LoginMemberRequestSuccess({this.login});

  @override
  List<Object> get props => [login];
}

class LoginMemberFailure extends LoginMemberState {
  final String error;

  const LoginMemberFailure({@required this.error});

  @override
  List<Object> get props => [error];
}