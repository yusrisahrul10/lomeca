import 'package:equatable/equatable.dart';

abstract class MasterMenuFavoriteEvent extends Equatable {
  const MasterMenuFavoriteEvent();
}

class FetchMasterMenuFavorite extends MasterMenuFavoriteEvent {
  final String branchId;

  FetchMasterMenuFavorite({this.branchId});

  @override
  List<Object> get props => [branchId];
}