import 'package:ancol_taking_order/app/bloc/member/member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/member/member_event.dart';
import 'package:ancol_taking_order/app/bloc/member/member_state.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_bloc.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_event.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_state.dart';
import 'package:ancol_taking_order/app/models/member.dart';
import 'package:ancol_taking_order/app/models/promo.dart';
import 'package:ancol_taking_order/app/screens/pages/member/member_page.dart';
import 'package:ancol_taking_order/app/screens/pages/promodetail/promo_detail_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:date_format/date_format.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = "";

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<MemberBloc>().add(FetchMember(token: token));
    context.bloc<PromoBloc>().add(FetchPromo(token: token));
  }

  String convertDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return formatDate(dateTime, [yyyy,'/', mm, '/', dd]);
  }

  @override
  void initState() {
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<MemberBloc, MemberState>(
            builder: (context, state) {
              if (state is MemberLoaded) {
                var getMemberData = ResultMember.fromJson(state.data);

                return Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => MemberPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xFF5F558B), width: 0)),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (NetworkImage(
                                          getMemberData.data.profile_pict)),
                                      fit: BoxFit.fill)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            getMemberData.data.member_name,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 14,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else if (state is MemberLoading) {
                return SpinKitFadingCircle(
                  color: kPrimaryColor,
                  size: 50,
                );
              } else if (state is MemberError) {
                // return Image.asset(circularProgressIndicator, scale: 5);
                return SpinKitFadingCircle(
                  color: mainWhiteDark,
                  size: 50,
                );
              }
              return Center(child: Text(""));
            },
          ),
        ),

        //todo note: card member
        BlocBuilder<MemberBloc, MemberState>(
          builder: (context, state) {
            if (state is MemberLoaded) {
              var getMemberData = ResultMember.fromJson(state.data);

              return Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                child: Card(
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  child: Ink(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipRect(
                              child: InkWell(
                                child: Image.network(
                                  getMemberData.data.card_front_image_path,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  color: Colors.black38,
                                  colorBlendMode: BlendMode.multiply,
                                ),
                                onTap: () {},
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        "Join Date",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      convertDate(getMemberData.data.created_at),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        getMemberData.data.member_name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      getMemberData.data.member_type_name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is MemberLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (state is MemberError) {
              // return Image.asset(circularProgressIndicator, scale: 5);
              return Center(child: const CircularProgressIndicator());
            }
            return Center(child: Text(""));
          },
        ),

        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            "Hot Promo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: BlocBuilder<PromoBloc, PromoState>(
            builder: (context, state) {
              if (state is PromoLoaded) {
                var getPromoData = ResultPromo.fromJson(state.promo);
                List<DataPromo> listPromo = getPromoData.data;

                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listPromo.length,
                    itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index == listPromo.length - 1)
                                ? defaultMargin
                                : 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => PromoDetailPage(idPromo: listPromo[index].id,)));
                          },
                          child: Container(
                            height: 180,
                            width: 310,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        listPromo[index].banner_image_path),
                                    fit: BoxFit.fill)),
                          ),

                          // MovieCard(
                          //   movies[index],
                          //   onTap: () {
                          //
                          //   },
                          // ),
                        )));
              } else if (state is MemberLoading) {
                return Center(child: const CircularProgressIndicator());
              } else if (state is MemberError) {
                // return Image.asset(circularProgressIndicator, scale: 5);
                return Center(child: const CircularProgressIndicator());
              }
              return Center(child: Text(""));
            },
          ),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
