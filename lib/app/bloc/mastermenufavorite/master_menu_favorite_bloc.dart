import 'package:ancol_taking_order/app/bloc/mastermenufavorite/master_menu_favorite_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenufavorite/master_menu_favorite_state.dart';
import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterMenuFavoriteBloc extends Bloc<MasterMenuFavoriteEvent, MasterMenuFavoriteState> {
  final ApiRepository repository;

  MasterMenuFavoriteBloc({this.repository}) : super(MasterMenuFavoriteInitial());


  @override
  Stream<MasterMenuFavoriteState> mapEventToState(MasterMenuFavoriteEvent event) async* {
    if (event is FetchMasterMenuFavorite) {
      yield* _mapLoadMasterMenuFavoriteToState(event.branchId);
    }
  }

  Stream<MasterMenuFavoriteState> _mapLoadMasterMenuFavoriteToState(String branchId) async* {
    try {
      yield MasterMenuFavoriteLoading();
      ResultMasterMenu menu = await repository.getMasterMenuFavorite(branchId);
      yield MasterMenuFavoriteLoaded(menu: menu);
    } catch (e) {
      yield MasterMenuFavoriteError(errorMessage: e.toString());
    }
  }

}