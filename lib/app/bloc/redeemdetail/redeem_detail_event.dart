import 'package:equatable/equatable.dart';

abstract class RedeemDetailEvent extends Equatable {
  const RedeemDetailEvent();
}

class FetchDetailRedeem extends RedeemDetailEvent {
  final String token;
  final String idRedeem;

  FetchDetailRedeem({this.token, this.idRedeem});

  @override
  List<Object> get props => [token, idRedeem];

}