import 'package:ancol_taking_order/app/bloc/checkorder/check_order_event.dart';
import 'package:ancol_taking_order/app/bloc/checkorder/check_order_state.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOrderBloc extends Bloc<CheckOrderEvent, CheckOrderState> {
  final ApiRepository repository;

  CheckOrderBloc({this.repository}) : super(CheckOrderInitial());

  @override
  Stream<CheckOrderState> mapEventToState(CheckOrderEvent event) async* {
    if (event is FetchCheckOrder) {
      yield* _mapLoadCheckOrderToState(event.orderNo, event.branchId, event.tableNo);
    }
  }

  Stream<CheckOrderState> _mapLoadCheckOrderToState(String orderNo, String branchId, String tableNo) async* {
    try {
      yield CheckOrderLoading();
      ResultOrder order = await repository.getCheckOrder(orderNo, branchId, tableNo);
      yield CheckOrderRequestSuccess(order: order);
    } catch (e) {
      yield CheckOrderError(errorMessage: e.toString());
    }
  }

}