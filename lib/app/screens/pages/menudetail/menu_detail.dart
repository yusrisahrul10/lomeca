import 'package:ancol_taking_order/app/bloc/mastermenuadditional/master_menu_additional_bloc.dart';
import 'package:ancol_taking_order/app/bloc/mastermenuadditional/master_menu_additional_event.dart';
import 'package:ancol_taking_order/app/bloc/mastermenuadditional/master_menu_additional_state.dart';
import 'package:ancol_taking_order/app/database/database.dart';
import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/models/restomenus.dart';
import 'package:ancol_taking_order/app/repositories/restomenus_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/components/foodItem.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class MenuDetails extends StatefulWidget {
  final Menu restoMenu;

  const MenuDetails({Key key, this.restoMenu}) : super(key: key);

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  double _counter = 1;
  final openDb = constructDb();

  int seqno;
  int detailSeqno;
  int detailSeqnoKeterangan;
  String branchId;

  TextEditingController keteranganController = TextEditingController();

  _setrefMenuid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('ref_menuid', widget.restoMenu.menuid);
  }

  _incrementSeqno() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seqno = (prefs.getInt('seqno') ?? 1) + 1;
    print('Pressed $seqno times.');
    await prefs.setInt('seqno', seqno);
  }

  _initialSeqno() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seqno = prefs.getInt('seqno') ?? 1;
    print('Pressed $seqno times.');
    await prefs.setInt('seqno', seqno);
  }

  _initialDetailSeqno() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    detailSeqno = prefs.getInt('detail_seqno') ?? 1;
    await prefs.setInt('detail_seqno', detailSeqno);
  }

  _incrementDetailSeqno() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    detailSeqno = (prefs.getInt('detail_seqno') ?? 1) + 1;
    await prefs.setInt('detail_seqno', detailSeqno);
  }

  _initialDetailSeqnoKeterangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    detailSeqnoKeterangan = prefs.getInt('detail_seqno_keterangan') ?? 800;
    await prefs.setInt('detail_seqno_keterangan', detailSeqnoKeterangan);
  }

  _incrementDetailSeqnoKeterangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    detailSeqnoKeterangan = (prefs.getInt('detail_seqno_keterangan') ?? 800) + 1;
    await prefs.setInt('detail_seqno_keterangan', detailSeqnoKeterangan);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  _getBranchId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      branchId = pref.getString('branch_id');
    });
    context.bloc<MasterMenuAdditionalBloc>().add(FetchMasterAdditionalMenu(branchId, widget.restoMenu.menuid));
  }

  @override
  void initState() {
    super.initState();
    _setrefMenuid();
    _initialSeqno();
    _initialDetailSeqno();
    _initialDetailSeqnoKeterangan();
    _getBranchId();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
       WillPopScope(
         onWillPop: () async {
           setState(() {
             Database(openDb.executor).deleteMenu(seqno);
           });
           Navigator.of(context).pop(true);
           return true;
         },
         child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: kPrimaryColor, //change your color here
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white.withOpacity(.94),
          body:
          SafeArea(
            child: Container(
              width: size.width,
              child: ListView(
                children: <Widget>[
                  buildBodyTop(size),
                  SizedBox(height: 16),
                  buildQty(size, _counter),
                  SizedBox(height: 16),
                  Visibility(
                    visible: true,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24, 30, 24, 12),
                      child: Text("Additional Menu",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // buildAdditionalMenu(),
                  createAdditionalMenu(),
                  SizedBox(height: 8),
                  buildKeterangan(),
                  SizedBox(height: 16),
                  // buildAddKeterangan(size),
                  SizedBox(height: 16),
                  createCartList(),
                  buildAddtoCart(size, _counter),
                ],
              ),
            ),
          ),
      ),
       );
    // );
  }



  Widget buildBodyTop(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      width: size.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(10),
        )),
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildFaveIcon(),
            buildImage(),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 30),
              child: Text(
                'Rp. ${widget.restoMenu.sellingprice}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25, color: kPrimaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10),
              child: Text(
                widget.restoMenu.menuname,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10),
              child: Text(
                widget.restoMenu.menuname1,
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    if (widget.restoMenu.menupict.isNotEmpty) {
      return Center(
        child: Hero(
          tag: widget.restoMenu.menupict,
          child: Image.network(
            widget.restoMenu.menupict,
            width: 180,
          ),
        ),
      );
    } else {
      return Center(
        child: Hero(
          tag: 'images/no_image.png',
          child: Image.asset(
            'images/Avocado_Salad.png',
            width: 180,
          ),
        ),
      );
    }
  }

  Widget buildFaveIcon() {
    return Row(
      children: <Widget>[
        Spacer(),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //   decoration: BoxDecoration(
        //       color: mainColorDark,
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(30),
        //         topRight: Radius.circular(30),
        //       )),
        //   child: Image.asset(
        //     'images/Heart.png',
        //     color: mainBlue,
        //     width: 18,
        //   ),
        // ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  // Widget buildAdditionalMenu() {
  //   final _fiteredMenu = _menuRepository
  //       .getPopularMenu()
  //       .where((i) => i.ismainmenu == 0)
  //       .toList();
  //   return SizedBox(
  //     height: 160,
  //     child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: _fiteredMenu.length,
  //         itemBuilder: (_, index) => Container(
  //             margin: EdgeInsets.only(
  //                 left: (index == 0) ? 24 : 0,
  //                 right: (index == _fiteredMenu.length - 1) ? 24 : 16),
  //             child: AdditionalMenuCard(
  //               restoMenu: _fiteredMenu[index],
  //             ))),
  //   );
  // }

  createAdditionalMenu() {

    return SizedBox(
      height: 160,
      child: BlocBuilder<MasterMenuAdditionalBloc, MasterMenuAdditionalState>(
        builder: (context, state) {
          if (state is MasterMenuAdditionalLoaded) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.menu.data.length,
                itemBuilder: (_, index) {
                  return additionalMenuCard(index, state.menu.data, state.menu.data[index]);
                }
            );
          } else if (state is MasterMenuAdditionalLoading) {
            return Image.asset(circularProgressIndicator, scale: 5);
          } else if (state is MasterMenuAdditionalError) {
            return Center(child: Text(state.errorMessage));
          }
          return Center(child: Text(""));
        },
      )
    );
  }

  Widget additionalMenuCard(int index, List<Menu> _fiteredMenu, Menu restoMenu) {
    return Container(
        margin: EdgeInsets.only(
            left: (index == 0) ? 24 : 0,
            right: (index == _fiteredMenu.length - 1) ? 24 : 16),
        child: GestureDetector(
          onTap: () {
            // _incrementCounter();
            _incrementDetailSeqno();
            setState(() {

              Database(openDb.executor).insertNewOrder(ItemCart(
                  // strukno: getStrukno(),
                  menuid: restoMenu.menuid,
                  ref_menuid: widget.restoMenu.menuid,
                  image: restoMenu.menupict,
                  name: restoMenu.menuname,
                  price: restoMenu.sellingprice,
                  qty: 1,
                  seqno: seqno,
                  detailseqno: detailSeqno));
            });
          },
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(restoMenu.menupict),
                        fit: BoxFit.cover)),
              ),
              Text(
                restoMenu.menuname,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Rp. ${restoMenu.sellingprice.toString()}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
        // AdditionalMenuCard(
        //   restoMenu: _fiteredMenu[index],
        // )
    );
  }

  createCartList() {
    return SizedBox(
      height: 180,
      child: StreamBuilder(
        stream: Database(openDb.executor).watchAllOrder(),
        builder: (context, AsyncSnapshot<List<ItemCart>> snapshot) {
          final filtered = snapshot.data
              .where((element) => element.ref_menuid.toString() == widget.restoMenu.menuid && element.seqno == seqno)
              .toList();
          return ListView.builder(
            itemBuilder: (context, position) {
              return buildAdditinalMenuList(filtered[position]);
            },
            itemCount: filtered.length,
          );
        },
      ),
    );
  }

  Widget buildAdditinalMenuList(ItemCart data) {
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(data.image))),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              setState(() {
                Database(openDb.executor).deleteCart(data);
              });
            },
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

  Widget buildQty(Size size, double qty) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Text(
          'Quantity',
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: GestureDetector(
            onTap: () {
              _decrementCounter();
            },
            child: Center(
              child: Icon(
                Icons.remove,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          qty.toString(),
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: GestureDetector(
            onTap: () {
              _incrementCounter();
            },
            child: Center(
              child: Icon(
                Icons.add,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget buildKeterangan() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: keteranganController,
        maxLines: 3,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Keterangan",
            hintText: "Tambahkan keterangan"),
      ),
    );
  }

  Widget buildAddtoCart(Size size, double qty) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            )),
        child: RepositoryProvider<Database>(
          create: (context) => constructDb(),
          child: TextButton(
            onPressed: () {
              _incrementSeqno();
              _incrementDetailSeqno();
              _incrementDetailSeqnoKeterangan();
              setState(() {
                Database(openDb.executor).insertNewOrder(ItemCart(
                    // strukno: getStrukno(),
                    menuid: widget.restoMenu.menuid,
                    image: widget.restoMenu.menupict,
                    name: widget.restoMenu.menuname,
                    price: widget.restoMenu.sellingprice,
                    qty: qty,
                    seqno: seqno,
                    detailseqno: 0));
                if (keteranganController.text.isNotEmpty) {
                  Database(openDb.executor).insertNewOrder(ItemCart(
                    // strukno: getStrukno(),
                      menuid: widget.restoMenu.menuid,
                      ref_menuid: widget.restoMenu.menuid,
                      image: "",
                      name: keteranganController.text,
                      price: 0,
                      qty: 1,
                      seqno: seqno,
                      detailseqno: detailSeqnoKeterangan));
                }

              });
              // bloc.createEntry(widget.restoMenu.image, widget.restoMenu.name, widget.restoMenu.price, 1);
              Navigator.pop(context);
            },
            child: Text(
              'Add to cart',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
