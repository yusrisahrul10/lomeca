import 'package:ancol_taking_order/app/models/login.dart';
import 'package:equatable/equatable.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();
}

class LogoutButtonPressed extends LogoutEvent {
  final String token;

  LogoutButtonPressed({this.token});

  @override
  List<Object> get props => [token];

}

class NavigateToLoginPage extends LogoutEvent {
  @override
  List<Object> get props => [];
}