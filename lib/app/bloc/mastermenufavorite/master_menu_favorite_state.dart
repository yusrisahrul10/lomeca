import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:equatable/equatable.dart';

abstract class MasterMenuFavoriteState extends Equatable {
  const MasterMenuFavoriteState();

  @override
  List<Object> get props => [];
}

class MasterMenuFavoriteInitial extends MasterMenuFavoriteState {}

class MasterMenuFavoriteLoading extends MasterMenuFavoriteState {}

class MasterMenuFavoriteLoaded extends MasterMenuFavoriteState {
  final ResultMasterMenu menu;

  MasterMenuFavoriteLoaded({this.menu});

  @override
  List<Object> get props => [menu];
}

class MasterMenuFavoriteError extends MasterMenuFavoriteState {
  final String errorMessage;

  MasterMenuFavoriteError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}