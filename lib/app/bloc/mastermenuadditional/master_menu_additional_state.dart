import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:equatable/equatable.dart';

abstract class MasterMenuAdditionalState extends Equatable {
  const MasterMenuAdditionalState();

  @override
  List<Object> get props => [];
}

class MasterMenuAdditionalInitial extends MasterMenuAdditionalState {}

class MasterMenuAdditionalLoading extends MasterMenuAdditionalState {}

class MasterMenuAdditionalLoaded extends MasterMenuAdditionalState {
  final ResultMasterMenu menu;

  MasterMenuAdditionalLoaded({this.menu});

  @override
  List<Object> get props => [menu];
}

class MasterMenuAdditionalError extends MasterMenuAdditionalState {
  final String errorMessage;

  MasterMenuAdditionalError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}