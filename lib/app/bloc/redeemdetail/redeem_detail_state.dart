import 'package:equatable/equatable.dart';

abstract class RedeemDetailState extends Equatable {
  const RedeemDetailState();

  @override
  List<Object> get props => [];
}

class RedeemDetailInitial extends RedeemDetailState {}

class RedeemDetailLoading extends RedeemDetailState {}

class RedeemDetailLoaded extends RedeemDetailState {
  final dynamic data;

  RedeemDetailLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class RedeemDetailError extends RedeemDetailState {
  final String errorMessage;

  RedeemDetailError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}