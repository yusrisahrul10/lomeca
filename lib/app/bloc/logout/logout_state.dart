import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutRequestSuccess extends LogoutState {
  final dynamic logout;

  LogoutRequestSuccess({this.logout});

  @override
  List<Object> get props => [logout];
}

class LogoutFailure extends LogoutState {
  final String error;

  const LogoutFailure({@required this.error});

  @override
  List<Object> get props => [error];
}