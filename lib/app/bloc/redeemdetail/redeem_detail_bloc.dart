import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_event.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_state.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RedeemDetailBloc extends Bloc<RedeemDetailEvent, RedeemDetailState> {
  final ApiRepository repository;

  RedeemDetailBloc({this.repository}) : super(RedeemDetailInitial());


  @override
  Stream<RedeemDetailState> mapEventToState(RedeemDetailEvent event) async* {
    if (event is FetchDetailRedeem) {
      yield* _mapLoadDetailRedeemToState(event.token, event.idRedeem);
    }
  }

  Stream<RedeemDetailState> _mapLoadDetailRedeemToState(String token, String idRedeem) async* {
    try {
      yield RedeemDetailLoading();
      var data = await repository.getDetailRedeemCoupon(token, idRedeem);
      yield RedeemDetailLoaded(data: data);
    } catch (e) {
      yield RedeemDetailError(errorMessage: e.toString());
    }
  }

}