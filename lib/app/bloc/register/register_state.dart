import 'package:ancol_taking_order/app/models/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterRequestSuccess extends RegisterState {
  final dynamic register;

  RegisterRequestSuccess({this.register});

  @override
  List<Object> get props => [register];
}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({@required this.error});

  @override
  List<Object> get props => [error];
}