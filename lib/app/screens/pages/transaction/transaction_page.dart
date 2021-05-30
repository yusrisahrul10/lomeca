import 'package:ancol_taking_order/app/bloc/neworder/new_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenu/master_menu_bloc.dart';
import 'package:ancol_taking_order/app/bloc/mastermenu/master_menu_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenu/mater_menu_state.dart';
import 'package:ancol_taking_order/app/bloc/mastermenufavorite/master_menu_favorite_bloc.dart';
import 'package:ancol_taking_order/app/bloc/mastermenufavorite/master_menu_favorite_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenufavorite/master_menu_favorite_state.dart';
import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/models/user.dart';
import 'package:ancol_taking_order/app/repositories/restomenus_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/cart/cart_page.dart';
import 'package:ancol_taking_order/app/screens/pages/neworder/new_order_page.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/components/menuClip.dart';
import 'package:ancol_taking_order/app/screens/pages/order/check_order_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/foodItem.dart';
import 'components/selected_clipper.dart';

class TransactionPage extends StatefulWidget {
  final ResultUser user;

  const TransactionPage({Key key, this.user}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  AnimationController controller;
  Animation animation;

  String orderNo;
  String tableNo;
  String todo;
  String branchId;

  _getOrderNo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      orderNo = pref.getString('orderno');
    });
  }

  _getTodo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      todo = pref.getString('todo');
    });
  }

  _getTableNo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      tableNo = pref.getString('tableno');
    });
  }

  _getBranchId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      branchId = pref.getString('branch_id');
    });
    context.bloc<MasterMenuBloc>().add(FetchMasterMenu(branchId: branchId));

  }


  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 240, end: 240).animate(controller);
    _getOrderNo();
    _getTableNo();
    _getTodo();
    _getBranchId();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('SHAREDPREF ORDERNO ' + orderNo);

    print('SHAREDPREF todo ' + todo);

    print('SHAREDPREF table no ' + tableNo);

    print('SHAREDPREF branchid ' + branchId);


    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        context.bloc<MasterMenuBloc>().add(NavigatorActionPopMenu());
        context.bloc<NewOrderBloc>().add(NavigatorNewOrderInitial());
        return;
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 40),
          width: size.width,
          child: Stack(
            children: <Widget>[
              buildMenuBar(size),
              buildSelectedContainer(),
              buildBody(size, currentIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuBar(Size size) {

    return ClipPath(
      clipper: MenuClip(),
      child: Container(
        height: size.height,
        width: 55,
        color: mainColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            buildButtonCheckOrder('images/menu.png'),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  buildRotatedBox('Our Menu', 0, () => {
                  context.bloc<MasterMenuBloc>().add(FetchMasterMenu(branchId: branchId))
                  }),
                  buildRotatedBox('Popular', 1, () => {
                  context.bloc<MasterMenuFavoriteBloc>().add(FetchMasterMenuFavorite(branchId: branchId))

                  }),
                  const Padding(padding: EdgeInsets.all(12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonCheckOrder(String imagePath) {
    return IconButton(
      icon: Image.asset(
        imagePath,
        width: 50,
        height: 50,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CheckOrderPage()));
      },
    );
  }

  Widget buildRotatedBox(String text, int index, ontap) {
    return InkWell(
      onTap: () {
        setState(() {
          animation = Tween<double>(
              begin: 220.0 + (currentIndex * 100),
              end: 220.0 + (index * 100))
              .animate(controller);
          currentIndex = index;
        });
        controller.forward(from: 0);
        //print('onTap');
        if (ontap != null) {
          ontap();
        }
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          width: 100,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildSelectedContainer() {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return Positioned(
            left: 55,
            top: animation.value,
            child: ClipPath(
              clipper: SelectedClip(),
              child: Container(
                color: mainColor,
                width: 50,
                height: 100,
              ),
            ),
          );
        });
  }

  Widget buildBody(Size size, int currentIndex) {

    if (currentIndex == 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 90),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Place your Order",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                  icon: Image.asset(
                    'images/cart.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    print('Cart Tapping');
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => CartPage()));
                  },
                ),
              ],
            ),
            Text(
              'you are on table ' + tableNo,
              style: TextStyle(
                fontSize: 12,
                color: mainColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'No Order ' + orderNo,
              style: TextStyle(
                fontSize: 12,
                color: mainColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Our Menu',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<MasterMenuBloc, MasterMenuState>(
                builder: (context, state) {
                  if (state is MasterMenuLoaded) {
                    List<Menu> masterMenu = state.menu.data;
                    return Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: ResponsiveGridRow(
                              children: masterMenu.where((element) => element.ismainmenu == 1).map((e) {
                                return ResponsiveGridCol(
                                  lg: 3,
                                  md: 6,
                                  xs: 12,
                                  child: FoodItem(e),
                                );
                              }).toList()),
                        ),
                      ),
                    );
                  } else if (state is MasterMenuLoading) {
                    return Image.asset(circularProgressIndicator, scale: 5);
                  } else if (state is MasterMenuError) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return Center(child: Text(""));
                }
            ),
          ],
        ),
      );
    } else if (currentIndex == 1) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 90),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Place your Order",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                  icon: Image.asset(
                    'images/cart.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    print('Cart Tapping');
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => CartPage()));
                  },
                ),
              ],
            ),
            Text(
              'you are on table ' + tableNo,
              style: TextStyle(
                fontSize: 12,
                color: mainColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'No Order ' + orderNo,
              style: TextStyle(
                fontSize: 12,
                color: mainColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Popular',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<MasterMenuFavoriteBloc, MasterMenuFavoriteState>(
                builder: (context, state) {
                  if (state is MasterMenuFavoriteLoaded) {
                    List<Menu> masterMenu = state.menu.data;
                    return Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: ResponsiveGridRow(
                              children: masterMenu.where((element) => element.ismainmenu == 1).map((e) {
                                return ResponsiveGridCol(
                                  lg: 3,
                                  md: 6,
                                  xs: 12,
                                  child: FoodItem(e),
                                );
                              }).toList()),
                        ),
                      ),
                    );
                  } else if (state is MasterMenuFavoriteLoading) {
                    return Image.asset(circularProgressIndicator, scale: 5);
                  } else if (state is MasterMenuFavoriteError) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return Center(child: Text(""));
                }
            ),
          ],
        ),
      );
    }
  }
}