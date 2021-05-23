import 'package:ancol_taking_order/app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class NewOrderState extends Equatable {
  const NewOrderState();

  @override
  List<Object> get props => [];
}

class NewOrderInitial extends NewOrderState {}

class NewOrderLoading extends NewOrderState {}

class NewOrderRequestSuccess extends NewOrderState {
  final ResultUser user;

  NewOrderRequestSuccess({this.user});

  @override
  List<Object> get props => [user];
}

class NewOrderFailure extends NewOrderState {
  final String error;

  const NewOrderFailure({@required this.error});

  @override
  List<Object> get props => [error];
}