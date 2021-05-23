import 'package:ancol_taking_order/app/models/order.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PostOrderState extends Equatable {
  const PostOrderState();

  @override
  List<Object> get props => [];
}

class PostOrderInitial extends PostOrderState {}

class PostOrderLoading extends PostOrderState {}

class PostOrderRequestSuccess extends PostOrderState {
  final dynamic data;

  PostOrderRequestSuccess({this.data});

  @override
  List<Object> get props => [data];
}

class PostOrderFailure extends PostOrderState {
  final String error;

  const PostOrderFailure({@required this.error});

  @override
  List<Object> get props => [error];

}