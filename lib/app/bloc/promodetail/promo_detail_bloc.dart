import 'package:ancol_taking_order/app/bloc/promo/promo_event.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_state.dart';
import 'package:ancol_taking_order/app/bloc/promodetail/promo_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/promodetail/promo_detail_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoDetailBloc extends Bloc<PromoDetailEvent, PromoDetailState> {
  final ApiRepository repository;

  PromoDetailBloc({this.repository}) : super(PromoDetailInitial());


  @override
  Stream<PromoDetailState> mapEventToState(PromoDetailEvent event) async* {
    if (event is FetchPromoDetail) {
      yield* _mapLoadPromoDetailToState(event.token, event.idPromo);
    }
  }

  Stream<PromoDetailState> _mapLoadPromoDetailToState(String token, String idPromo) async* {
    try {
      yield PromoDetailLoading();
      var data = await repository.getPromoDetail(token, idPromo);
      yield PromoDetailLoaded(promo: data);
    } catch (e) {
      yield PromoDetailError(errorMessage: e.toString());
    }
  }

}