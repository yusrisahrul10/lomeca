import 'package:ancol_taking_order/app/models/login.dart';
import 'package:ancol_taking_order/app/models/register.dart';
import 'package:equatable/equatable.dart';

abstract class VerifyTokenEvent extends Equatable {
  const VerifyTokenEvent();
}

class VerifyTokenButtonPressed extends VerifyTokenEvent {
  final String verifyMember;
  final String token;

  VerifyTokenButtonPressed({this.verifyMember, this.token});

  @override
  List<Object> get props => [verifyMember, token];
}

class NavigateToLoginPage extends VerifyTokenEvent {
  final ResultRegister register;

  NavigateToLoginPage({this.register});

  @override
  List<Object> get props => throw [register];
}

class NavigatorActionPop extends VerifyTokenEvent {
  @override
  List<Object> get props => [];

}