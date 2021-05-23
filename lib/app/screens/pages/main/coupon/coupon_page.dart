import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_bloc.dart';
import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_event.dart';
import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_state.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_event.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_state.dart';
import 'package:ancol_taking_order/app/models/redeem.dart';
import 'package:ancol_taking_order/app/models/voucher.dart';
import 'package:ancol_taking_order/app/screens/pages/redeemdetail/redeem_detail_page.dart';
import 'package:ancol_taking_order/app/screens/pages/voucherdetail/voucher_detail_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponPage extends StatefulWidget {
  final int couponPageIndex;

  CouponPage({this.couponPageIndex = 0});

  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  int couponPageIndex;
  String token = "";

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<RedeemCouponBloc>().add(FetchRedeemCoupon(token: token));
  }

  @override
  void initState() {
    super.initState();

    couponPageIndex = widget.couponPageIndex;
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // note: CONTENT
        buildBody(couponPageIndex),
        // note: HEADER
        Container(
          height: 113,
          color: kPrimaryColor,
        ),
        SafeArea(
            child: ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 113,
            color: kPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Container(
                //     margin: EdgeInsets.only(left: 24, bottom: 32),
                //     child: Text(
                //       "Voucher Saya",
                //       style: TextStyle(color: Colors.white, fontSize: 20),
                //     )),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              couponPageIndex = 0;
                              context.bloc<RedeemCouponBloc>().add(FetchRedeemCoupon(token: token));
                            });
                          },
                          child: Text(
                            "Redeem",
                            style: TextStyle(
                              color:
                              couponPageIndex == 0 ? Colors.white : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: couponPageIndex == 0 ? Colors.black : Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              couponPageIndex = 1;
                              context.bloc<MemberVoucherBloc>().add(FetchMemberVoucher(token: token));
                            });
                          },
                          child: Text(
                            "Voucher Saya",
                            style: TextStyle(
                                fontSize: 16,
                                color: couponPageIndex == 1 ? Colors.white : Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: couponPageIndex == 1 ? Colors.black : Colors.transparent,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    ));
  }

  Widget buildBody(int couponPageIndex) {
    if (couponPageIndex == 0) {
      return BlocBuilder<RedeemCouponBloc, RedeemCouponState>(
        builder: (context, state) {
          if (state is RedeemCouponLoaded) {
            var getRedeemData = ResultRedeem.fromJson(state.data);
            List<DataRedeem> listRedeem = getRedeemData.data;

            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listRedeem.length,
                itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(top: index == 0 ? 133 : 20, bottom: index == listRedeem.length - 1 ? 100: 8 ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 40, 8, 5),
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
                                        listRedeem[index].banner_image_path,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                        color: Colors.black38,
                                        colorBlendMode: BlendMode.multiply,
                                      ),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (_) => RedeemDetailPage(idRedeem: listRedeem[index].id,)));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Text(
                                      "Point yang dibutuhkan: \n${listRedeem[index].redeem_point}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text(
                                        "Berlaku Hingga: \n${listRedeem[index].end_at}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )));
          } else if (state is RedeemCouponLoading) {
            return Center(child: const CircularProgressIndicator());
          } else if (state is RedeemCouponError) {
            // return Image.asset(circularProgressIndicator, scale: 5);
            return Center(child: const CircularProgressIndicator());
          }
          return Center(child: Text(""));
        },
      );
    } else {
      return BlocBuilder<MemberVoucherBloc, MemberVoucherState>(
          builder: (context, state) {
            if (state is MemberVoucherLoaded) {
              var getVoucherData = ResultVoucher.fromJson(state.data);
              List<DataVoucher> listVoucher = getVoucherData.data;

              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listVoucher.length,
                  itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(top: index == 0 ? 133 : 20, bottom: index == listVoucher.length - 1 ? 100: 8 ),
                      child: Padding(
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
                                          listVoucher[index].voucher_banner_image_path,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          color: Colors.black38,
                                          colorBlendMode: BlendMode.multiply,
                                        ),
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(builder: (_) => VoucherDetailPage(idVoucher: listVoucher[index].id,)));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text(
                                        "Point yang dibutuhkan: \n${listVoucher[index].redeem_coupon.redeem_point}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        child: Text(
                                          "Berlaku Hingga: \n${listVoucher[index].end_at}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )));
            } else if (state is MemberVoucherLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (state is MemberVoucherError) {
              return Center(child: Text(state.errorMessage));
            }
            return Center(child: Text(""));
          });
    }
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
