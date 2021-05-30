import 'package:ancol_taking_order/app/bloc/register/register_event.dart';
import 'package:ancol_taking_order/app/bloc/register/register_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/verify/verify_token_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  RegisterBloc({this.repository, this.navigatorKey}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield* _mapRegisterToState(event.name, event.email, event.password, event.passwordConfirmation, event.phonenumber, event.gender, event.address);
    }
    else if (event is NavigateToVerifyPage) {
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => VerifyTokenPage()));
    } else if (event is NavigateActionRegisterPop) {
      yield* _popState();
    }
  }

  Stream<RegisterState> _popState() async* {
    yield RegisterInitial();
  }

  Stream<RegisterState> _mapRegisterToState(String name, String email, String password, String passwordConfirmation, String phonenumber, String gender, String address) async* {
    try {
      yield RegisterLoading();
      var data = await repository.postRegister(name, email, password, passwordConfirmation, phonenumber, gender, address);
      yield RegisterRequestSuccess(register: data);
    } catch (e) {
      yield RegisterFailure(error: e.toString());
    }
  }

}