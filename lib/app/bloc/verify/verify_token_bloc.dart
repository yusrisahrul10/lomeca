import 'package:ancol_taking_order/app/bloc/verify/verify_token_event.dart';
import 'package:ancol_taking_order/app/bloc/verify/verify_token_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/loginmember/login_member_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyTokenBloc extends Bloc<VerifyTokenEvent, VerifyTokenState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  VerifyTokenBloc({this.repository, this.navigatorKey}) : super(VerifyTokenInitial());

  @override
  Stream<VerifyTokenState> mapEventToState(VerifyTokenEvent event) async* {
    if (event is VerifyTokenButtonPressed) {
      yield* _mapVerifyTokenToState(event.verifyMember, event.token);
    }
    else if (event is NavigateToLoginPage) {
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => LoginMemberPage()));
      yield* _popState();
    }
  }

  Stream<VerifyTokenState> _popState() async* {
    yield VerifyTokenInitial();
  }

  Stream<VerifyTokenState> _mapVerifyTokenToState(String verifyMember, String token) async* {
    try {
      yield VerifyTokenLoading();
      var data = await repository.postVerifyToken(verifyMember, token);
      yield VerifyTokenRequestSuccess(register: data);
    } catch (e) {
      yield VerifyTokenFailure(error: e.toString());
    }
  }

}