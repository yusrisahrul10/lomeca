import 'package:equatable/equatable.dart';

abstract class MemberVoucherDetailEvent extends Equatable {
  const MemberVoucherDetailEvent();
}

class FetchMemberVoucherDetail extends MemberVoucherDetailEvent {
  final String token;
  final String idVoucher;

  FetchMemberVoucherDetail({this.token, this.idVoucher});

  @override
  List<Object> get props => [token];

}