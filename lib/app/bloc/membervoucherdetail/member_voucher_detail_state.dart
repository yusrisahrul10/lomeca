import 'package:equatable/equatable.dart';

abstract class MemberVoucherDetailState extends Equatable {
  const MemberVoucherDetailState();

  @override
  List<Object> get props => [];
}

class MemberVoucherDetailInitial extends MemberVoucherDetailState {}

class MemberVoucherDetailLoading extends MemberVoucherDetailState {}

class MemberVoucherDetailLoaded extends MemberVoucherDetailState {
  final dynamic data;

  MemberVoucherDetailLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class MemberVoucherDetailError extends MemberVoucherDetailState {
  final String errorMessage;

  MemberVoucherDetailError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}