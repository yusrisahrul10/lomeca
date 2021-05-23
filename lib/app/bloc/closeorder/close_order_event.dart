import 'package:equatable/equatable.dart';

abstract class CloseOrderEvent extends Equatable {
  const CloseOrderEvent();

  @override
  List<Object> get props => [];
}

class CloseOrderPressed extends CloseOrderEvent {
  final String branchId;
  final String tableNo;
  final String orderNo;

  CloseOrderPressed({this.branchId, this.tableNo, this.orderNo});

  @override
  List<Object> get props => throw [branchId, tableNo, orderNo];
}


class NavigatorActionCloseOrderPop extends CloseOrderEvent {
  @override
  List<Object> get props => [];

}