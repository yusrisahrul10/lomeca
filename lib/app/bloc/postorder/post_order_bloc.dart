import 'package:ancol_taking_order/app/bloc/postorder/post_order_event.dart';
import 'package:ancol_taking_order/app/bloc/postorder/post_order_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/finish/finish_page.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostOrderBloc extends Bloc<PostOrderEvent, PostOrderState>{
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  PostOrderBloc({this.repository, this.navigatorKey}) : super(PostOrderInitial());

  @override
  Stream<PostOrderState> mapEventToState(PostOrderEvent event) async* {
    if (event is PostOrderPressed) {
      yield* _mapPostOrderToState(event.orderNo, event.branchId, event.tableNo, event.detail);
    }
    else if (event is NavigateToFinishPage) {
      navigatorKey.currentState.pushReplacement(
          MaterialPageRoute(builder: (_) => FinishPage(order: event.order, user: event.user))
      );
    }
    else if (event is NavigatorActionPop) {
      navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => TransactionPage()), (route) => false);
      yield* _mainPageState();
    }
  }

  Stream<PostOrderState> _mainPageState() async* {
    yield PostOrderInitial();
  }

  Stream<PostOrderState> _mapPostOrderToState(String orderNo, String branchId, String tableNo, List detail) async* {
    try {
      yield PostOrderLoading();
      var data = await repository.postOrder(orderNo, branchId, tableNo, detail);
      yield PostOrderRequestSuccess(data: data);
    } catch (e) {
      yield PostOrderFailure(error: e.toString());
    }
  }

}