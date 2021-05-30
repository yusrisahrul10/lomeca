import 'package:ancol_taking_order/app/bloc/mastermenu/master_menu_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenu/mater_menu_state.dart';
import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterMenuBloc extends Bloc<MasterMenuEvent, MasterMenuState> {
  final ApiRepository repository;

  MasterMenuBloc({this.repository}) : super(MasterMenuInitial());

  @override
  Stream<MasterMenuState> mapEventToState(MasterMenuEvent event) async* {
    if (event is FetchMasterMenu) {
      yield* _mapLoadMasterMenuToState(event.branchId);
    } else if (event is NavigatorActionPopMenu) {
      yield* _popState();
    }
  }

  Stream<MasterMenuState> _popState() async* {
    yield MasterMenuInitial();
  }

  Stream<MasterMenuState> _mapLoadMasterMenuToState(String branchId) async* {
    try {
      yield MasterMenuLoading();
      ResultMasterMenu menu = await repository.getMasterMenu(branchId);
      yield MasterMenuLoaded(menu: menu);
    } catch (e) {
        yield MasterMenuError(errorMessage: e.toString());
    }
  }

}