import 'package:ancol_taking_order/app/bloc/membervoucherdetail/member_voucher_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/membervoucherdetail/member_voucher_detail_state.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MemberVoucherDetailBloc extends Bloc<MemberVoucherDetailEvent, MemberVoucherDetailState> {
  final ApiRepository repository;

  MemberVoucherDetailBloc({this.repository}) : super(MemberVoucherDetailInitial());

  @override
  Stream<MemberVoucherDetailState> mapEventToState(MemberVoucherDetailEvent event) async* {
    if (event is FetchMemberVoucherDetail) {
      yield* _mapLoadMemberVoucherDetailToState(event.token, event.idVoucher);
    }
  }

  Stream<MemberVoucherDetailState> _mapLoadMemberVoucherDetailToState(String token, String idVoucher) async* {
    try {
      yield MemberVoucherDetailLoading();
      var data = await repository.getDetailMemberVoucher(token, idVoucher);
      yield MemberVoucherDetailLoaded(data: data);
    } catch (e) {
      yield MemberVoucherDetailError(errorMessage: e.toString());
    }
  }

}