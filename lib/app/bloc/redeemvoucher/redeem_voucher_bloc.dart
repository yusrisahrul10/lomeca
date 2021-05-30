import 'package:ancol_taking_order/app/bloc/redeemvoucher/redeem_voucher_event.dart';
import 'package:ancol_taking_order/app/bloc/redeemvoucher/redeem_voucher_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RedeemVoucherBloc extends Bloc<RedeemVoucherEvent, RedeemVoucherState> {
  final ApiRepository repository;
  final GlobalKey<NavigatorState> navigatorKey;

  RedeemVoucherBloc({this.repository, this.navigatorKey}) : super(RedeemVoucherInitial());

  @override
  Stream<RedeemVoucherState> mapEventToState(RedeemVoucherEvent event) async* {
    if (event is RedeemVoucherPressed) {
      yield* _mapRedeemVoucherToState(event.redeemId, event.token);
    }

    if (event is NavigatorActionRedeemPop) {
      navigatorKey.currentState.pushNamedAndRemoveUntil('/home_page',
              (Route<dynamic> route) => false);
      yield* _popState();
    }
  }

  Stream<RedeemVoucherState> _popState() async* {
    yield RedeemVoucherInitial();
  }

  Stream<RedeemVoucherState> _mapRedeemVoucherToState(String redeemId, String token) async* {
    try {
      yield RedeemVoucherLoading();
      var data = await repository.postRedeemVoucher(redeemId, token);
      yield RedeemVoucherRequestSuccess(redeem: data);
    } catch (e) {
      yield RedeemVoucherFailure(error: e.toString());
    }
  }

}