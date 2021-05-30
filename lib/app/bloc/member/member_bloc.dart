import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'member_event.dart';
import 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final ApiRepository repository;

  MemberBloc({this.repository}) : super(MemberInitial());

  @override
  Stream<MemberState> mapEventToState(MemberEvent event) async* {
    if (event is FetchMember) {
      yield* _mapLoadMemberToState(event.token);
    }
    if (event is NavigatorActionMemberPop) {
      yield* _popState();
    }
  }

  Stream<MemberState> _popState() async* {
    yield MemberInitial();
  }

  Stream<MemberState> _mapLoadMemberToState(String token) async* {
    try {
      yield MemberLoading();
      var data = await repository.getMemberDetail(token);
      yield MemberLoaded(data: data);
    } catch (e) {
      yield MemberError(errorMessage: e.toString());
    }
  }

}