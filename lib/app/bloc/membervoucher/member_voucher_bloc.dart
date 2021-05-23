import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_event.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'member_voucher_event.dart';
import 'member_voucher_state.dart';

class MemberVoucherBloc extends Bloc<MemberVoucherEvent, MemberVoucherState> {
  final ApiRepository repository;

  MemberVoucherBloc({this.repository}) : super(MemberVoucherInitial());


  @override
  Stream<MemberVoucherState> mapEventToState(MemberVoucherEvent event) async* {
    if (event is FetchMemberVoucher) {
      yield* _mapLoadMemberVoucherToState(event.token);
    }
  }

  Stream<MemberVoucherState> _mapLoadMemberVoucherToState(String token) async* {
    try {
      yield MemberVoucherLoading();
      var data = await repository.getListMemberVoucher(token);
      yield MemberVoucherLoaded(data: data);
    } catch (e) {
      yield MemberVoucherError(errorMessage: e.toString());
    }
  }

}