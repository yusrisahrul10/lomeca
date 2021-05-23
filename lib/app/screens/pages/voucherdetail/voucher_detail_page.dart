import 'package:ancol_taking_order/app/bloc/membervoucherdetail/member_voucher_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/membervoucherdetail/member_voucher_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/membervoucherdetail/member_voucher_detail_state.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_state.dart';
import 'package:ancol_taking_order/app/models/detail_voucher.dart';
import 'package:ancol_taking_order/app/models/redeem.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class VoucherDetailPage extends StatefulWidget {
  final String idVoucher;

  const VoucherDetailPage({Key key, this.idVoucher}) : super(key: key);

  @override
  _VoucherDetailPageState createState() => _VoucherDetailPageState();
}

class _VoucherDetailPageState extends State<VoucherDetailPage> {

  String token = "";

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<MemberVoucherDetailBloc>().add(FetchMemberVoucherDetail(token: token, idVoucher: widget.idVoucher));
  }


  @override
  void initState() {
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: kPrimaryColor,
            ),
            SafeArea(
                child: Container(
                  color: Colors.white,
                )),
            ListView(
              children: [
                BlocBuilder<MemberVoucherDetailBloc, MemberVoucherDetailState>(builder: (context, state) {
                  if (state is MemberVoucherDetailLoaded) {
                    var getVoucherData = ResultDetailVoucher.fromJson(state.data);

                    return Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            // note: BACKDROP
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 270,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(getVoucherData.data.voucher_banner_image_path),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 271,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment(0, 1),
                                          end: Alignment(0, 0.06),
                                          colors: [
                                            Colors.white,
                                            Colors.white.withOpacity(0)
                                          ])),
                                )
                              ],
                            ),
                            // note: BACK ICON
                            Container(
                              margin:
                              EdgeInsets.only(top: 20, left: defaultMargin),
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.04)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        // note: JUDUL
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 16, defaultMargin, 6),
                          child: Text(
                              getVoucherData.data.voucher_title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24
                            )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: [
                                  Text(
                                      "Berlaku Mulai",
                                      style: TextStyle(fontSize: 14)
                                  ),
                                  Text(
                                    getVoucherData.data.start_at,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                      "Berlaku Hingga",
                                      style: TextStyle(fontSize: 14)
                                  ),
                                  Text(
                                    getVoucherData.data.end_at,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // note: STORYLINE
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 24, defaultMargin, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Deskripsi Voucher",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 30),
                          child: Text(
                            getVoucherData.data.voucher_descr,
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 24, defaultMargin, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Ketentuan",
                              style: TextStyle(
                                color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 30),
                          child: Text(
                            getVoucherData.data.voucher_descr2,
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: defaultMargin)
                      ],
                    );
                  } else if (state is MemberVoucherDetailLoading) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (state is MemberVoucherDetailError) {
                    return Center(child: Text(state.errorMessage));
                  }

                  return Center(child: Text(""));
                })
              ],
            )
          ],
        ),
      ),
    );
  }

}
