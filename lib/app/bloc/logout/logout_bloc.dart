import 'package:ancol_taking_order/app/bloc/loginmember/login_member_event.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_state.dart';
import 'package:ancol_taking_order/app/bloc/logout/logout_event.dart';
import 'package:ancol_taking_order/app/bloc/logout/logout_state.dart';
import 'package:ancol_taking_order/app/models/login.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/loginmember/login_member_page.dart';
import 'package:ancol_taking_order/app/screens/pages/main/main_page.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/transaction_page.dart';
import 'package:ancol_taking_order/app/screens/pages/verify/verify_token_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  LogoutBloc({this.repository, this.navigatorKey}) : super(LogoutInitial());

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is LogoutButtonPressed) {
      yield* _mapLogoutToState(event.token);
    }
    else if (event is NavigateToLoginPage) {
      navigatorKey.currentState.pushNamedAndRemoveUntil('/login_page',
              (Route<dynamic> route) => false);
      yield* _popState();
    }
  }

  Stream<LogoutState> _popState() async* {
    yield LogoutInitial();
  }

  Stream<LogoutState> _mapLogoutToState(String token) async* {
    try {
      yield LogoutLoading();
      // ResultLogin login = await repository.postLoginMember(email, password);
      var data = await repository.postLogoutMember(token);
      yield LogoutRequestSuccess(logout: data);
    } catch (e) {
      yield LogoutFailure(error: e.toString());
    }
  }

}