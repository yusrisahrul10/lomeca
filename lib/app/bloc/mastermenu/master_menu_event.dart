import 'package:equatable/equatable.dart';

abstract class MasterMenuEvent extends Equatable {
  const MasterMenuEvent();
}

class FetchMasterMenu extends MasterMenuEvent {
  final String branchId;

  FetchMasterMenu({this.branchId});

  @override
  List<Object> get props => [branchId];

}

class NavigatorActionPopMenu extends MasterMenuEvent {
  @override
  List<Object> get props => [];

}