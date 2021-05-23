import 'package:equatable/equatable.dart';

abstract class MemberVoucherState extends Equatable {
  const MemberVoucherState();

  @override
  List<Object> get props => [];
}

class MemberVoucherInitial extends MemberVoucherState {}

class MemberVoucherLoading extends MemberVoucherState {}

class MemberVoucherLoaded extends MemberVoucherState {
  final dynamic data;

  MemberVoucherLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class MemberVoucherError extends MemberVoucherState {
  final String errorMessage;

  MemberVoucherError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}