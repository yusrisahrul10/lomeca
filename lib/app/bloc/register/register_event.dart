import 'package:ancol_taking_order/app/models/register.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phonenumber;
  final String gender;
  final String address;

  RegisterButtonPressed({this.name, this.email, this.password, this.passwordConfirmation,this.phonenumber,this.gender,this.address});

  @override
  List<Object> get props => [name, email, password, passwordConfirmation,phonenumber,gender,address];
}

class NavigateToVerifyPage extends RegisterEvent {
  final ResultRegister register;

  NavigateToVerifyPage({this.register});

  @override
  List<Object> get props => throw [register];
}

class NavigateActionRegisterPop extends RegisterEvent {
  @override
  List<Object> get props => [];
}