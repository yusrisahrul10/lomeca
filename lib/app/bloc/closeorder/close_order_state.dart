import 'package:ancol_taking_order/app/models/order.dart';
import 'package:equatable/equatable.dart';

abstract class CloseOrderState extends Equatable {
  const CloseOrderState();

  @override
  List<Object> get props => [];
}

class CloseOrderInitial extends CloseOrderState {}

class CloseOrderLoading extends CloseOrderState {}

class CloseOrderRequestSuccess extends CloseOrderState {
  final ResultOrder data;

  CloseOrderRequestSuccess({this.data});

  @override
  List<Object> get props => [data];
}

class CloseOrderFailure extends CloseOrderState {
  final String error;

  const CloseOrderFailure({this.error});

  @override
  List<Object> get props => [error];

}