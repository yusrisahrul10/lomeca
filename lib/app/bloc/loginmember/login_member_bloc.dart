import 'package:ancol_taking_order/app/bloc/loginmember/login_member_event.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_state.dart';
import 'package:ancol_taking_order/app/models/login.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/main/main_page.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/transaction_page.dart';
import 'package:ancol_taking_order/app/screens/pages/verify/verify_token_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginMemberBloc extends Bloc<LoginMemberEvent, LoginMemberState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  LoginMemberBloc({this.repository, this.navigatorKey}) : super(LoginMemberInitial());

  @override
  Stream<LoginMemberState> mapEventToState(LoginMemberEvent event) async* {
    if (event is LoginMemberButtonPressed) {
      yield* _mapLoginMemberToState(event.email, event.password);
    }
    else if (event is NavigateToHomePage) {
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    }
    else if (event is NavigateToVerifyPage) {
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => VerifyTokenPage()));
    } else if (event is NavigatorActionLogin) {
      yield* _loginState();
    }
  }

  Stream<LoginMemberState> _loginState() async* {
    yield LoginMemberInitial();
  }

  Stream<LoginMemberState> _mapLoginMemberToState(String email, String password) async* {
    try {
      yield LoginMemberLoading();
      // ResultLogin login = await repository.postLoginMember(email, password);
      var data = await repository.postLoginMember(email, password);
      yield LoginMemberRequestSuccess(login: data);
    } catch (e) {
      yield LoginMemberFailure(error: e.toString());
    }
  }

}