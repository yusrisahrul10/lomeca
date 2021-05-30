import 'package:ancol_taking_order/app/bloc/promo/promo_event.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final ApiRepository repository;

  PromoBloc({this.repository}) : super(PromoInitial());

  @override
  Stream<PromoState> mapEventToState(PromoEvent event) async* {
    if (event is FetchPromo) {
      yield* _mapLoadPromoToState(event.token);
    }
    if (event is NavigatorActionPromoPop) {
      yield* _popState();
    }
  }

  Stream<PromoState> _popState() async* {
    yield PromoInitial();
  }

  Stream<PromoState> _mapLoadPromoToState(String token) async* {
    try {
      yield PromoLoading();
      var data = await repository.getListPromo(token);
      yield PromoLoaded(promo: data);
    } catch (e) {
      yield PromoError(errorMessage: e.toString());
    }
  }

}