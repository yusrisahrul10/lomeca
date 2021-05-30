import 'package:equatable/equatable.dart';

abstract class RedeemVoucherEvent extends Equatable {
  const RedeemVoucherEvent();

  @override
  List<Object> get props => [];
}

class RedeemVoucherPressed extends RedeemVoucherEvent {
  final String redeemId;
  final String token;

  RedeemVoucherPressed({this.redeemId, this.token});

  @override
  List<Object> get props => throw [redeemId, token];
}


class NavigatorActionRedeemPop extends RedeemVoucherEvent {
  @override
  List<Object> get props => [];
}