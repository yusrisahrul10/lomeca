import 'package:ancol_taking_order/app/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class NewOrderEvent extends Equatable {
  const NewOrderEvent();
}

class NewOrderButtonPressed extends NewOrderEvent {
  final String branchId;
  final String phoneNumber;
  final String tableNo;

  NewOrderButtonPressed({this.branchId, this.phoneNumber, this.tableNo});

  @override
  List<Object> get props => [phoneNumber, tableNo];

}

class NavigateToMainPage extends NewOrderEvent {
  final ResultUser user;

  NavigateToMainPage({this.user});

  @override
  List<Object> get props => throw [user];
}

class NavigatorActionPop extends NewOrderEvent {
  @override
  List<Object> get props => [];

}

class NavigatorActionLoginInitial extends NewOrderEvent {
  @override
  List<Object> get props => [];

}