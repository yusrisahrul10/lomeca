import 'package:equatable/equatable.dart';

abstract class MemberVoucherEvent extends Equatable {
  const MemberVoucherEvent();
}

class FetchMemberVoucher extends MemberVoucherEvent {
  final String token;

  FetchMemberVoucher({this.token});

  @override
  List<Object> get props => [token];

}