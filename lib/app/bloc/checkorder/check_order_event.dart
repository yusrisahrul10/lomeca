import 'package:equatable/equatable.dart';

abstract class CheckOrderEvent extends Equatable {
  const CheckOrderEvent();
}

class FetchCheckOrder extends CheckOrderEvent {
  final String orderNo;
  final String branchId;
  final String tableNo;

  FetchCheckOrder({this.orderNo, this.branchId, this.tableNo});

  @override
  List<Object> get props => [orderNo, branchId, tableNo];

}