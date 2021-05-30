
import 'package:ancol_taking_order/app/bloc/neworder/new_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_state.dart';
import 'package:ancol_taking_order/app/bloc/postorder/post_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/postorder/post_order_event.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/models/user.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishPage extends StatefulWidget {
  final ResultOrder order;
  final ResultUser user;

  const FinishPage({Key key, this.order, this.user}) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        color: mainBlue,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Image.asset(
                  'images/order_received.jpg',
                  height: 300,
                ),
              ),
              Container(
                child: Positioned(
                  top: 250,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Your order has been placed,',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(25),
                            ),
                            Text(
                              'Thank you for your order, our staff will contact you soon for confirmation...',
                              textAlign: TextAlign.center,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(100),
                            ),
                            DefaultButton(
                              text: "Done",
                              press: () {
                                setState(() {
                                  context
                                      .bloc<PostOrderBloc>()
                                      .add(NavigatorActionPop(user: widget.user));
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}