import 'package:ancol_taking_order/app/bloc/closeorder/close_order_event.dart';
import 'package:ancol_taking_order/app/bloc/closeorder/close_order_state.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CloseOrderBloc extends Bloc<CloseOrderEvent, CloseOrderState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;


  CloseOrderBloc({this.repository, this.navigatorKey}) : super(CloseOrderInitial());

  @override
  Stream<CloseOrderState> mapEventToState(CloseOrderEvent event) async* {
      if (event is CloseOrderPressed) {
        yield* _mapCloseOrderToState(event.branchId, event.tableNo, event.orderNo);
      }

      if (event is NavigatorActionCloseOrderPop) {
        yield* _popState();
      }
  }

  Stream<CloseOrderState> _popState() async* {
    yield CloseOrderInitial();
  }

  Stream<CloseOrderState> _mapCloseOrderToState(String branchId, String tableNo, String orderNo) async* {
    try {
      yield CloseOrderLoading();
      ResultOrder order = await repository.postCloseOrder(branchId, tableNo, orderNo);
      yield CloseOrderRequestSuccess(data: order);
    } catch (e) {
      yield CloseOrderFailure(error: e.toString());
    }
  }

}