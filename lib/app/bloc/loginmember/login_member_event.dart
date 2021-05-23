import 'package:ancol_taking_order/app/models/login.dart';
import 'package:equatable/equatable.dart';

abstract class LoginMemberEvent extends Equatable {
  const LoginMemberEvent();
}

class LoginMemberButtonPressed extends LoginMemberEvent {
  final String email;
  final String password;
  final String client_id;

  LoginMemberButtonPressed({this.email, this.password, this.client_id});

  @override
  List<Object> get props => [email, password];

}

class NavigateToHomePage extends LoginMemberEvent {
  final ResultLogin login;

  NavigateToHomePage({this.login});

  @override
  List<Object> get props => throw [login];
}

class NavigateToVerifyPage extends LoginMemberEvent {
  final ResultLogin login;

  NavigateToVerifyPage({this.login});

  @override
  List<Object> get props => throw [login];
}

class NavigatorActionLogin extends LoginMemberEvent {
  @override
  List<Object> get props => [];

}