import 'package:equatable/equatable.dart';

abstract class MasterMenuAdditionalEvent extends Equatable {
  final String branchid;
  final String menuid;

  const MasterMenuAdditionalEvent(this.branchid, this.menuid);
}

class FetchMasterAdditionalMenu extends MasterMenuAdditionalEvent {
  @override
  List<Object> get props => [];

  FetchMasterAdditionalMenu(String branchid, String menuid) : super(branchid, menuid);
}