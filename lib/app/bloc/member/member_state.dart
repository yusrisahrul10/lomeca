import 'package:equatable/equatable.dart';

abstract class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

class MemberInitial extends MemberState {}

class MemberLoading extends MemberState {}

class MemberLoaded extends MemberState {
  final dynamic data;

  MemberLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class MemberError extends MemberState {
  final String errorMessage;

  MemberError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}