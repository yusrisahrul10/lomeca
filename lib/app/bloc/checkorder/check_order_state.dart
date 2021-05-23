import 'package:ancol_taking_order/app/models/order.dart';
import 'package:equatable/equatable.dart';

abstract class CheckOrderState extends Equatable {
  const CheckOrderState();

  @override
  List<Object> get props => [];
}

class CheckOrderInitial extends CheckOrderState {}

class CheckOrderLoading extends CheckOrderState {}

class CheckOrderRequestSuccess extends CheckOrderState {
  final ResultOrder order;

  CheckOrderRequestSuccess({this.order});

  @override
  List<Object> get props => [order];
}

class CheckOrderError extends CheckOrderState {
  final String errorMessage;

  CheckOrderError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}