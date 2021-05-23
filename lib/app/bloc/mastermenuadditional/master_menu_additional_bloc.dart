import 'package:ancol_taking_order/app/bloc/mastermenuadditional/master_menu_additional_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenuadditional/master_menu_additional_state.dart';
import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterMenuAdditionalBloc extends Bloc<MasterMenuAdditionalEvent, MasterMenuAdditionalState> {
  final ApiRepository repository;

  MasterMenuAdditionalBloc({this.repository}) : super(MasterMenuAdditionalInitial());


  @override
  Stream<MasterMenuAdditionalState> mapEventToState(MasterMenuAdditionalEvent event) async* {
    if (event is FetchMasterAdditionalMenu) {
      yield* _mapLoadMasterMenuAdditionalToState(event.menuid, event.branchid);
    }
  }

  Stream<MasterMenuAdditionalState> _mapLoadMasterMenuAdditionalToState(String menuid, String branchId) async* {
    try {
      yield MasterMenuAdditionalLoading();
      ResultMasterMenu menu = await repository.getAdditionalMenu(branchId, menuid);
      yield MasterMenuAdditionalLoaded(menu: menu);
    } catch (e) {
      yield MasterMenuAdditionalError(errorMessage: e.toString());
    }
  }

}