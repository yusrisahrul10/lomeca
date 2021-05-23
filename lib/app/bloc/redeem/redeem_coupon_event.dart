import 'package:equatable/equatable.dart';

abstract class RedeemCouponEvent extends Equatable {
  const RedeemCouponEvent();
}

class FetchRedeemCoupon extends RedeemCouponEvent {
  final String token;

  FetchRedeemCoupon({this.token});

  @override
  List<Object> get props => [token];

}