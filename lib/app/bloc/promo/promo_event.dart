import 'package:equatable/equatable.dart';

abstract class PromoEvent extends Equatable {
  const PromoEvent();
}

class FetchPromo extends PromoEvent {
  final String token;

  FetchPromo({this.token});

  @override
  List<Object> get props => [token];
}

class NavigatorActionPromoPop extends PromoEvent {
  @override
  List<Object> get props => [];
}