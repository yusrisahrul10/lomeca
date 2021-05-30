import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_event.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RedeemCouponBloc extends Bloc<RedeemCouponEvent, RedeemCouponState> {
  final ApiRepository repository;

  RedeemCouponBloc({this.repository}) : super(RedeemCouponInitial());

  @override
  Stream<RedeemCouponState> mapEventToState(RedeemCouponEvent event) async* {
    if (event is FetchRedeemCoupon) {
      yield* _mapLoadRedeemCouponToState(event.token);
    }
  }

  Stream<RedeemCouponState> _mapLoadRedeemCouponToState(String token) async* {
    try {
      yield RedeemCouponLoading();
      var data = await repository.getListRedeemCoupon(token);
      yield RedeemCouponLoaded(data: data);
    } catch (e) {
      yield RedeemCouponError(errorMessage: e.toString());
    }
  }

}