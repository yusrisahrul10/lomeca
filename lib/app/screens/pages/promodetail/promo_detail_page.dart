import 'package:ancol_taking_order/app/bloc/promodetail/promo_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/promodetail/promo_detail_event.dart';
import 'package:ancol_taking_order/app/bloc/promodetail/promo_detail_state.dart';
import 'package:ancol_taking_order/app/models/promo.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoDetailPage extends StatefulWidget {
  final String idPromo;

  const PromoDetailPage({Key key, this.idPromo}) : super(key: key);

  @override
  _PromoDetailPageState createState() => _PromoDetailPageState();
}

class _PromoDetailPageState extends State<PromoDetailPage> {
  String token = "";

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<PromoDetailBloc>().add(FetchPromoDetail(token: token, idPromo: widget.idPromo));
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
                BlocBuilder<PromoDetailBloc, PromoDetailState>(builder: (context, state) {
                  if (state is PromoDetailLoaded) {
                    var getPromoData = ResultPromo.fromJson(state.promo);

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
                                          image: NetworkImage(getPromoData.data[0].banner_image_path),
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
                              getPromoData.data[0].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 24, defaultMargin, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Deskripsi Promo",
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
                            getPromoData.data[0].message,
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: defaultMargin)
                      ],
                    );
                  } else if (state is PromoDetailLoading) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (state is PromoDetailError) {
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
