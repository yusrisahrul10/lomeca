import 'package:ancol_taking_order/app/bloc/checkorder/check_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/checkorder/check_order_event.dart';
import 'package:ancol_taking_order/app/bloc/checkorder/check_order_state.dart';
import 'package:ancol_taking_order/app/bloc/closeorder/close_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/closeorder/close_order_event.dart';
import 'package:ancol_taking_order/app/bloc/closeorder/close_order_state.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_event.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:flutter/material.dart';
import 'package:ancol_taking_order/app/database/database.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOrderPage extends StatefulWidget {
  @override
  _CheckOrderPageState createState() => _CheckOrderPageState();
}

class _CheckOrderPageState extends State<CheckOrderPage> {
  final openDb = constructDb();

  List<ItemCart> getData;

  var orderNo;
  var tableNo;
  var total;
  String branchId;

  _getTotalAmount(double totalAmount) async {
    setState(() {
      total = totalAmount;
    });
  }

  _getOrderNoTableNo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      orderNo = pref.getString('orderno');
      tableNo = pref.getString('tableno');
      branchId = pref.getString('branch_id');
    });
    print("ORDER NO KOK ERRRORRRRR" + orderNo);
    print("TABLE NO " + tableNo);
    context.bloc<CheckOrderBloc>().add(
        FetchCheckOrder(orderNo: orderNo, branchId: branchId, tableNo: tableNo));
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
          'Your Orders',
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
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text(
                'you are on table ' + tableNo,
                style: TextStyle(
                  fontSize: 14,
                  color: mainColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text(
                'No Order ' + orderNo,
                style: TextStyle(
                  fontSize: 14,
                  color: mainColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            createOrderList(),
            buildBody(size, total)
          ],
        ),
      ),
    );
  }

  createOrderList() {
    return BlocBuilder<CheckOrderBloc, CheckOrderState>(
        builder: (context, state) {
      if (state is CheckOrderInitial) {
        return Center(child: Text(""));
      }
      if (state is CheckOrderRequestSuccess) {

        print('CHECK ORDER ' + state.order.message.toString());
        print('DATA ORDER ' + state.order.data.detail.toString());

        List<DetailOrder> order = state.order.data.detail.toList();

        _getTotalAmount(state.order.data.totalamount);

        print('TOTAL AMOUNT FROM BLOC' + total.toString());


        var mainMenu =
            order.where((element) => element.ref_menuid == "null").toList();
        return Container(
          child: Column (
            children: [
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, position) {
                  var subtotal = mainMenu[position].qty * mainMenu[position].hjual;

                  return createOrderListItem(mainMenu[position], order, subtotal, state.order.data.totalamount);
                },
                itemCount: mainMenu.length,
              ),
              Container(
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
                            Text(
                              state.order.data.totalamount.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        );
      } else if (state is CheckOrderLoading) {
        return Image.asset(circularProgressIndicator, scale: 5);
      } else if (state is CheckOrderError) {
        return Center(child: Text(state.errorMessage));
      }
      return Center(child: Text(""));
    });
  }

  createOrderListItem(
      DetailOrder mainMenu, List<DetailOrder> additionalMenu, double subtotal, double totalAmount) {
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
                              mainMenu.menuname,
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
                                  "${mainMenu.qty.toString()} x Rp ${mainMenu.hjual.toString()}",
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Column(children: [
                                  Text(
                                    subtotal.toString(),
                                  ),
                                  Text("DIPROSES"),
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    flex: 100,
                  ),
                ],
              ),
              createAdditionalMenuList(mainMenu, additionalMenu),

            ],

          ),
        ),
      ],
    );
  }

  createAdditionalMenuList(
      DetailOrder data, List<DetailOrder> dataAdditionalMenu) {
    final additionalMenu = dataAdditionalMenu
        .where((element) =>
            element.ref_menuid != "null" && element.seqno == data.seqno)
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createAdditionalListItem(additionalMenu[position]);
      },
      itemCount: additionalMenu.length,
    );
  }

  createAdditionalListItem(DetailOrder data) {
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
                    image: DecorationImage(image: AssetImage(data.menuid))),
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
                          data.menuname,
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
                              "Rp ${data.hjual}",
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

  Widget buildBody(Size size, double total) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TotalCalculationWidget(totalAmount: total),
          // SizedBox(
          //   height: 10,
          // ),
          DefaultButton(
            text: "Finish Order",
            press: () {
              setState(() {
                context.bloc<CloseOrderBloc>().add(CloseOrderPressed(
                    branchId: branchId, tableNo: tableNo, orderNo: orderNo));
              });
            },
          ),
          // Container(
          //   padding: EdgeInsets.only(left: 5),
          //   width: double.infinity,
          //   height: 40,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       context.bloc<CloseOrderBloc>().add(CloseOrderPressed(
          //           branchId: branchId, tableNo: tableNo, orderNo: orderNo));
          //
          //     },
          //     child: Text(
          //       "Finish Order",
          //       style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600),
          //       textAlign: TextAlign.left,
          //     ),
          //   ),
          // ),
          BlocBuilder<CloseOrderBloc, CloseOrderState>(
              builder: (context, state) {
            if (state is CloseOrderLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (state is CloseOrderRequestSuccess) {
              if (state.data.status == "false") {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  setState(() async {
                    SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                    await preferences.clear();
                    Dialogs.materialDialog(
                        color: Colors.white,
                        msg: 'Error',
                        title: state.data.message,
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
                    await preferences.clear();
                    Dialogs.materialDialog(
                        color: Colors.white,
                        msg: 'Thanks for your order',
                        title: state.data.message,
                        context: context,
                        actions: [
                          IconsButton(
                            onPressed: () {
                              context.bloc<NewOrderBloc>().add(NavigatorActionPop());
                              context.bloc<CloseOrderBloc>().add(NavigatorActionCloseOrderPop());
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
            } else if (state is CloseOrderFailure) {
              return Center(child: Text(state.error));
            }
            return Center(child: Text(""));
          })
        ],
      ),
    );
  }
}

class TotalCalculationWidget extends StatefulWidget {
  final double totalAmount;

  const TotalCalculationWidget({Key key, this.totalAmount}) : super(key: key);

  @override
  _TotalCalculationWidgetState createState() => _TotalCalculationWidgetState();
}

class _TotalCalculationWidgetState extends State<TotalCalculationWidget> {
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
                  Text(
                    widget.totalAmount.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
}


// class TotalCalculationWidget extends StatelessWidget {
//   final openDb = constructDb();
//
//   TotalCalculationWidget({this.totalAmount});
//
//   final double totalAmount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       width: double.infinity,
//       //height: 150,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: Color(0xFFfae3e2).withOpacity(0.1),
//           spreadRadius: 1,
//           blurRadius: 1,
//           offset: Offset(0, 1),
//         ),
//       ]),
//       child: Card(
//         color: Colors.white,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(5.0),
//           ),
//         ),
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     "Total",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xFF3a3a3b),
//                         fontWeight: FontWeight.w600),
//                     textAlign: TextAlign.left,
//                   ),
//                   Text(
//                     totalAmount.toString(),
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xFF3a3a3b),
//                         fontWeight: FontWeight.w600),
//                     textAlign: TextAlign.left,
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
