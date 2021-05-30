import 'package:equatable/equatable.dart';

abstract class PromoDetailEvent extends Equatable {
  const PromoDetailEvent();
}

class FetchPromoDetail extends PromoDetailEvent {
  final String token;
  final String idPromo;

  FetchPromoDetail({this.token, this.idPromo});

  @override
  List<Object> get props => [token];
}