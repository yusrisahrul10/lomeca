import 'package:equatable/equatable.dart';

abstract class MemberEvent extends Equatable {
  const MemberEvent();
}

class FetchMember extends MemberEvent {
  final String token;

  FetchMember({this.token});

  @override
  List<Object> get props => [token];
}

class NavigatorActionMemberPop extends MemberEvent {
  @override
  List<Object> get props => [];
}