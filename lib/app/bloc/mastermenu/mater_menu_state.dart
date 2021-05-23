import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:equatable/equatable.dart';

abstract class MasterMenuState extends Equatable {
  const MasterMenuState();

  @override
  List<Object> get props => [];
}

class MasterMenuInitial extends MasterMenuState {}

class MasterMenuLoading extends MasterMenuState {}

class MasterMenuLoaded extends MasterMenuState {
  final ResultMasterMenu menu;

  MasterMenuLoaded({this.menu});

  @override
  List<Object> get props => [menu];
}

class MasterMenuError extends MasterMenuState {
  final String errorMessage;

  MasterMenuError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}