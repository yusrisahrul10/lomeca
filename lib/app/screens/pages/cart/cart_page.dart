import 'package:ancol_taking_order/app/bloc/postorder/post_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/postorder/post_order_event.dart';
import 'package:ancol_taking_order/app/bloc/postorder/post_order_state.dart';
import 'package:ancol_taking_order/app/database/database.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/models/post_order.dart';
import 'package:ancol_taking_order/app/models/user.dart';
import 'package:ancol_taking_order/app/screens/voucher/voucher_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  final ResultUser user;

  const CartPage({Key key, this.user}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final openDb = constructDb();

  double qty;

  String orderNo;
  String tableNo;
  String branchId;


  List<PostOrder> getData;

  _getOrderNoTableNo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    orderNo = pref.getString('orderno');
    tableNo = pref.getString('tableno');
    branchId = pref.getString('branch_id');
  }


  @override
  void initState() {
    super.initState();
    _getOrderNoTableNo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor),
        backgroundColor: mainWhiteDark,
        elevation: 0,
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        child: ListView(
          children: <Widget>[
            createCartList(),
            SizedBox(
              height: 8,
            ),
            createVoucherCard(),
            SizedBox(
              height: 8,
            ),
            buildBody(size)
          ],
        ),
      ),
    );
  }

  createCartList() {
    return StreamBuilder(
      stream: Database(openDb.executor).watchAllOrder(),
      builder: (context, AsyncSnapshot<List<ItemCart>> snapshot) {
        final filtered = snapshot.data
            .where((element) =>
                element.ref_menuid == null && element.menuid != "999")
            .toList();

        getData = snapshot.data
            .map((e) => PostOrder(
                menuid: e.menuid.toString(),
                qty: e.qty.toInt(),
                hjual: e.price,
                discamount: 0,
                detailamount: 1000,
                seqno: e.seqno,
                detailseqno: e.detailseqno,
                ref_menuid: e.ref_menuid.toString(),
                menuname: e.name))
            .toList();

        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, position) {
            return createCartListItem(filtered[position]);
          },
          itemCount: filtered.length,
        );
      },
    );
  }

  createVoucherCard() {
    return StreamBuilder(
      stream: Database(openDb.executor).watchAllOrder(),
      builder: (context, AsyncSnapshot<List<ItemCart>> snapshot) {
        final filtered = snapshot.data
            .where((element) => element.menuid == "999")
            .toList();

        getData = snapshot.data
            .map((e) => PostOrder(
                menuid: e.menuid.toString(),
                qty: e.qty.toInt(),
                hjual: e.price,
                discamount: 0,
                detailamount: 1000,
                seqno: e.seqno,
                detailseqno: e.detailseqno,
                ref_menuid: e.ref_menuid.toString(),
                menuname: e.name))
            .toList();

        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, position) {
            return createVoucherItem(filtered[position]);
          },
          itemCount: filtered.length,
        );
      },
    );
  }

  createVoucherItem(ItemCart data) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text(
                              "Voucher dipakai",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 8, top: 4),
                            child: Text(
                              data.name,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rp ${(-data.price).toString()}",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Database(openDb.executor).deleteMenu(data.seqno);
            });
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.green),
            ),
          ),
        )
      ],
    );
  }

  createCartListItem(ItemCart data) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        color: Colors.blue.shade200,
                        image: DecorationImage(image: AssetImage('images/Avocado_Salad.png',
                        ))),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 8, top: 4),
                            child: Text(
                              data.name,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rp ${data.price.toString()}",
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Material(
                                          type: MaterialType.transparency,
                                          //Makes it usable on any background color, thanks @IanSmith
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kPrimaryColor,
                                                  width: 4.0),
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: InkWell(
                                              //This keeps the splash effect within the circle
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              //Something large to ensure a circle
                                              onTap: () {
                                                setState(() {
                                                  if (data.qty > 1) {
                                                    Database(openDb.executor)
                                                        .decreaseQtyMenu(
                                                            data.menuid);
                                                  }
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          data.qty.toString(),
                                          // style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Material(
                                          type: MaterialType.transparency,
                                          //Makes it usable on any background color, thanks @IanSmith
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kPrimaryColor,
                                                  width: 4.0),
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: InkWell(
                                              //Thifs keeps the splash effect within the circle
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              //Something large to ensure a circle
                                              onTap: () {
                                                setState(() {
                                                  // Database(openDb.executor).updateQty(data.copyWith(qty: qty++));
                                                  Database(openDb.executor)
                                                      .updateQtyMenu(
                                                          data.menuid);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 100,
                  ),
                ],
              ),
              createAdditionalMenuList(data)
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Database(openDb.executor).deleteMenu(data.seqno);
            });
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.green),
            ),
          ),
        )
      ],
    );
  }

  createAdditionalMenuList(ItemCart data) {
    return StreamBuilder(
      stream: Database(openDb.executor).watchAllOrder(),
      builder: (context, AsyncSnapshot<List<ItemCart>> snapshot) {
        final filtered = snapshot.data
            .where((element) =>
                element.ref_menuid != null && element.seqno == data.seqno)
            .toList();
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, position) {
            return createAdditionalListItem(filtered[position]);
          },
          itemCount: filtered.length,
        );
      },
    );
  }

  createAdditionalListItem(ItemCart data) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(image: AssetImage(data.image))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          data.name,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Rp ${data.price}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody(Size size) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => VoucherPage()))
                  .then((value) {
                setState(() {
                  build(context);
                });
              });
            },
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("images/receipt.svg"),
                  ),
                  Spacer(),
                  Text("Gunakan voucher"),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kTextColor,
                  )
                ],
              ),
            ),
          ),
          TotalCalculationWidget(),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              stream: Database(openDb.executor).getTotal(),
              builder: (context, AsyncSnapshot<double> snapshot) {
                return DefaultButton(
                  text: "Place Order",
                  press: () => Dialogs.bottomMaterialDialog(
                      msg:
                      'Apakah Anda sudah yakin dengan pesanan Anda? Pesanan tidak dapat dibatalkan',
                      title: 'Place Order',
                      context: context,
                      actions: [
                        IconsOutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Batal',
                          iconData: Icons.cancel_outlined,
                          textStyle: TextStyle(color: Colors.grey),
                          iconColor: Colors.grey,
                        ),
                        IconsButton(
                          onPressed: () {
                            Navigator.pop(context);
                            for (var i in getData) {
                              print("GET DATA " + i.ref_menuid);
                            }
                            context.bloc<PostOrderBloc>().add(
                                PostOrderPressed(
                                    orderNo: orderNo,
                                    tableNo: tableNo,
                                    branchId: branchId,
                                    detail: getData
                                ));
                          },
                          text: 'Lanjutkan',
                          iconData: Icons.delete,
                          color: Colors.red,
                          textStyle: TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                        ),
                      ]),
                );
              }),
          BlocBuilder<PostOrderBloc, PostOrderState>(
            builder: (context, state) {
              if (state is PostOrderLoading) {
                return Center(child: const CircularProgressIndicator());
              } else if (state is PostOrderRequestSuccess) {
                print("LOG orderno " + orderNo);
                print("LOG tableno " + tableNo);
                // print('LOG ORDER ' + state.data.toString());

                var getOrder = ResultOrder.fromJson(state.data);
                if (getOrder.status == "true") {
                  context
                      .bloc<PostOrderBloc>()
                      .add(NavigateToFinishPage(order: getOrder
                  ));
                  Database(openDb.executor).deleteAllCart();
                } else {
                  return Center(child: Text(getOrder.message));
                }

              } else if (state is PostOrderFailure) {
                return Center(child: Text(state.error));
              }
              return Center(child: Text(""));
            },
          )
        ],
      ),
    );
  }
}

class TotalCalculationWidget extends StatelessWidget {
  final openDb = constructDb();
  double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      //height: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  StreamBuilder(
                      stream: Database(openDb.executor).getTotal(),
                      builder: (context, AsyncSnapshot<double> snapshot) {
                        return snapshot.data.toString() == null
                            ? Text(
                                "Rp 0",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.left,
                              )
                            : Text(
                                snapshot.data.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.left,
                              );
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
