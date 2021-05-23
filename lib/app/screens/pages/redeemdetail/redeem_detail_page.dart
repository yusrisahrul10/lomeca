import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_state.dart';
import 'package:ancol_taking_order/app/bloc/redeemvoucher/redeem_voucher_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeemvoucher/redeem_voucher_event.dart';
import 'package:ancol_taking_order/app/bloc/redeemvoucher/redeem_voucher_state.dart';
import 'package:ancol_taking_order/app/models/post_redeem.dart';
import 'package:ancol_taking_order/app/models/redeem.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import 'package:flutter/scheduler.dart';




class RedeemDetailPage extends StatefulWidget {
  final String idRedeem;

  const RedeemDetailPage({Key key, this.idRedeem}) : super(key: key);

  @override
  _RedeemDetailPageState createState() => _RedeemDetailPageState();
}

class _RedeemDetailPageState extends State<RedeemDetailPage> {

  String token = "";

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<RedeemDetailBloc>().add(FetchDetailRedeem(token: token, idRedeem: widget.idRedeem));
  }


  @override
  void initState() {
    getToken();
  }

  @override
  Widget build(BuildContext context) {

    print("ID REDEEM " + widget.idRedeem);

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
                BlocBuilder<RedeemDetailBloc, RedeemDetailState>(builder: (context, state) {
                  if (state is RedeemDetailLoaded) {
                    var getVoucherData = ResultRedeem.fromJson(state.data);
                    print("message " + getVoucherData.message);
                    print("getVoucherData " + getVoucherData.data[0].title);

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
                                          image: NetworkImage(getVoucherData.data[0].banner_image_path),
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
                              getVoucherData.data[0].title,
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
                                    "Poin",
                                      style: TextStyle(fontSize: 14)
                                  ),
                                  Text(
                                    getVoucherData.data[0].redeem_point.toString(),
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
                                      "Berlaku Mulai",
                                      style: TextStyle(fontSize: 14)
                                  ),
                                  Text(
                                    getVoucherData.data[0].start_at,
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
                                    getVoucherData.data[0].end_at,
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
                            getVoucherData.data[0].descr,
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
                            getVoucherData.data[0].descr2.toString(),
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ),

                        // note: BUTTON
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: kPrimaryColor,
                            child: Text(
                              "Redeem",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                              ),
                            ),
                            onPressed: () {
                              context
                                  .bloc<RedeemVoucherBloc>()
                                  .add(RedeemVoucherPressed(
                                redeemId: getVoucherData.data[0].id,
                                token: token
                              ));
                            }),
                        SizedBox(height: defaultMargin)
                      ],
                    );
                  } else if (state is RedeemDetailLoading) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (state is RedeemDetailError) {
                    return Center(child: Text(state.errorMessage));
                  }

                  return Center(child: Text(""));
                }),
                BlocBuilder<RedeemVoucherBloc, RedeemVoucherState>(
                    builder: (context, state) {
                      if (state is RedeemVoucherLoading) {
                        return Center(child: const CircularProgressIndicator());
                      } else if (state is RedeemVoucherRequestSuccess) {
                        var redeem = ResultPostRedeem.fromJson(state.redeem);

                        if (redeem.status == "false") {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            setState(() async {
                              SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                              // await preferences.clear();
                              Dialogs.materialDialog(
                                  color: Colors.white,
                                  msg: 'Error',
                                  title: redeem.message,
                                  context: context,
                                  actions: [
                                    IconsButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: 'Kembali',
                                      iconData: Icons.done,
                                      color: kPrimaryColor,
                                      textStyle: TextStyle(color: Colors.white),
                                      iconColor: Colors.white,
                                    ),
                                  ]);
                            });
                          });
                        } else {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            setState(() async {
                              SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                              // await preferences.clear();
                              Dialogs.materialDialog(
                                  color: Colors.white,
                                  msg: 'Berhasil',
                                  title: redeem.message,
                                  context: context,
                                  actions: [
                                    IconsButton(
                                      onPressed: () {
                                        // context.bloc<RedeemVoucherBloc>().add(NavigatorActionRedeemPop());
                                        Navigator.pop(context);
                                      },
                                      text: 'Selesai',
                                      iconData: Icons.done,
                                      color: kPrimaryColor,
                                      textStyle: TextStyle(color: Colors.white),
                                      iconColor: Colors.white,
                                    ),
                                  ]);
                            });
                          });
                        }
                      } else if (state is RedeemVoucherFailure) {
                        return Center(child: Text(state.error));
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
