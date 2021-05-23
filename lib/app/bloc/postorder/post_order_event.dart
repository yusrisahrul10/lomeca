import 'package:ancol_taking_order/app/database/database.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/models/post_order.dart';
import 'package:ancol_taking_order/app/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class PostOrderEvent extends Equatable {
  const PostOrderEvent();

  @override
  List<Object> get props => [];
}

class PostOrderPressed extends PostOrderEvent {
  final String orderNo;
  final String branchId;
  final String tableNo;
  final List detail;

  PostOrderPressed({this.orderNo, this.branchId, this.tableNo, this.detail});

  @override
  List<Object> get props => throw [orderNo, branchId, tableNo, detail];
}

class NavigateToFinishPage extends PostOrderEvent {
  final ResultOrder order;
  final ResultUser user;

  NavigateToFinishPage({this.order, this.user});

  @override
  List<Object> get props => throw [order];
}

class NavigatorActionPop extends PostOrderEvent {
  final ResultUser user;

  NavigatorActionPop({this.user});

  @override
  List<Object> get props => throw [user];
}