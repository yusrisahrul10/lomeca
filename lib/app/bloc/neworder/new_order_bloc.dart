import 'package:ancol_taking_order/app/bloc/neworder/new_order_event.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_state.dart';
import 'package:ancol_taking_order/app/models/user.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  NewOrderBloc({this.repository, this.navigatorKey}) : super(NewOrderInitial());

  @override
  Stream<NewOrderState> mapEventToState(NewOrderEvent event) async* {
    if (event is NewOrderButtonPressed) {
        yield* _mapNewOrderToState(event.branchId, event.phoneNumber, event.tableNo);
    }
    else if (event is NavigateToMainPage) {
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => TransactionPage(user: event.user)));
    }
    else if (event is NavigatorActionPop) {
      navigatorKey.currentState.pushNamedAndRemoveUntil('/new_order_page',
              (Route<dynamic> route) => false);
      yield* _logoutState();
    } else if (event is NavigatorNewOrderInitial) {
      yield* _logoutState();
    }
  }

  Stream<NewOrderState> _logoutState() async* {
    yield NewOrderInitial();
  }


  Stream<NewOrderState> _mapNewOrderToState(String branchId, String phoneNumber, String tableNo) async* {
    try {
      yield NewOrderLoading();
      ResultUser user = await repository.postLoginTable(branchId, phoneNumber, tableNo);
      yield NewOrderRequestSuccess(user: user);
    } catch (e) {
      yield NewOrderFailure(error: e.toString());
    }
  }
  
}