import 'package:ancol_taking_order/app/bloc/neworder/new_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_event.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_state.dart';
import 'package:ancol_taking_order/app/database/database.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/components/menuClip.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/transaction_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class NewOrderPage extends StatefulWidget {
  // final String branchid;
  // final String tableno;
  //
  // LoginPage({String branchid = "Test", String tableno = "Test"})
  //     : this.branchid = branchid,
  //       this.tableno = tableno;

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  TextEditingController _customerPhoneController = TextEditingController();
  TextEditingController _customerTableNoController = TextEditingController();

  // _setBranchId() async {
  //   if (widget.branchid.isNotEmpty) {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     await pref.setString('branch_id', widget.branchid);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _setBranchId();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // print('BRANCH ID LOCALHOST ' + widget.branchid);
    // print('TABLE NO LOCALHOST ' + widget.tableno);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        width: size.width,
        child: Stack(
          children: <Widget>[
            // buildMenuBar(size),
            //buildSelectedContainer(),
            buildBody(
                size, _customerPhoneController, _customerTableNoController),
          ],
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
            Image.asset(
              'images/menu.png',
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  buildRotatedBox('Login', 0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRotatedBox(String text, int index) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        width: 100,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildBody(
    Size size,
    TextEditingController _customerPhoneController,
    TextEditingController _customerTableNoController,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Masukkan No Meja dan No Telepon",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: InputForm(
                  customerPhoneController: _customerPhoneController,
                  customerTableNoController: _customerTableNoController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  final TextEditingController customerTableNoController;
  final TextEditingController customerPhoneController;
  final String branchId;

  const InputForm({
    Key key,
    this.customerTableNoController,
    this.customerPhoneController,
    this.branchId,
  }) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();

  final openDb = constructDb();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        constraints: BoxConstraints(minHeight: 200, minWidth: 260),
        margin: EdgeInsets.only(top: 5, left: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Table No.',
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: widget.customerTableNoController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    //labelText: "Your Name",
                  ),
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  autocorrect: false,
                  expands: false,
                  autofocus: true,
                ),
                Text(
                  'No Phone',
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: widget.customerPhoneController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    //labelText: "Your Name",
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  autocorrect: false,
                  expands: false,
                  autofocus: true,
                ),
                const Padding(padding: EdgeInsets.all(12)),
                DefaultButton(
                  text: "Start Order...",
                  press: () {
                    setState(() {
                      context.bloc<NewOrderBloc>().add(NewOrderButtonPressed(
                          branchId: "FB01",
                          phoneNumber: widget.customerPhoneController.text,
                          tableNo: widget.customerTableNoController.text));
                      Database(openDb.executor).deleteAllCart();
                    });
                  },
                ),
                // Container(
                //   width: double.infinity,
                //   height: 40,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         context.bloc<NewOrderBloc>().add(NewOrderButtonPressed(
                //           branchId: "FB01",
                //             phoneNumber: widget.customerPhoneController.text,
                //             tableNo: widget.customerTableNoController.text));
                //         Database(openDb.executor).deleteAllCart();
                //       });
                //     },
                //     child: Text('Start Order...'),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<NewOrderBloc, NewOrderState>(
                  builder: (context, state) {
                    if (state is NewOrderLoading) {
                      return Center(child: const CircularProgressIndicator());
                    } else if (state is NewOrderRequestSuccess) {
                      // if (state.user.data.tableno == "Test") {
                      //   return Center(
                      //       child: Text(
                      //           "No meja tidak ditemukan. Mohon pindai ulang QR Code"));
                      // } else {
                      //
                      // }
                      if (state.user.status == "true") {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          setState(() async {
                            SharedPreferences pref =
                            await SharedPreferences.getInstance();
                            await pref.setString(
                                'orderno', state.user.data.orderno);
                            await pref.setString(
                                'phonenumber', state.user.data.phonenumber);
                            await pref.setString(
                                'tableno', state.user.data.tableno);
                            await pref.setString('todo', state.user.todo);
                            await pref.setString('branch_id', "FB01");
                          });

                        });
                        context
                            .watch<NewOrderBloc>()
                            .add(NavigateToMainPage(user: state.user));
                      } else {
                        return Center(child: Text(state.user.message));
                      }
                    } else if (state is NewOrderFailure) {
                      return Center(child: Text(state.error));
                    }
                    return Center(child: Text(""));
                  },
                ),
                // Container(
                //   width: double.infinity,
                //   height: 40,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       final db = Database(openDb.executor);
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => MoorDbViewer(db)));
                //     },
                //     child: Text('check moor'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
