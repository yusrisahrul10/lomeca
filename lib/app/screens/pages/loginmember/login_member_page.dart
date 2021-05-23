import 'package:ancol_taking_order/app/bloc/loginmember/login_member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_event.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_state.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_event.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_state.dart';
import 'package:ancol_taking_order/app/models/login.dart';
import 'package:ancol_taking_order/app/models/redeem.dart';
import 'package:ancol_taking_order/app/screens/pages/main/main_page.dart';
import 'package:ancol_taking_order/app/screens/pages/register/register_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginMemberPage extends StatefulWidget {
  @override
  _LoginMemberPageState createState() => _LoginMemberPageState();
}

class _LoginMemberPageState extends State<LoginMemberPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String getToken;

  _getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      getToken = pref.getString('token');
    });
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Lomeca",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Form(
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Email Address",
                              hintText: "Email Address"),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Password",
                              hintText: "Password"),
                        ),
                        // SizedBox(height: getProportionateScreenHeight(30)),
                        // Row(
                        //   children: [
                        //     Checkbox(
                        //       value: remember,
                        //       activeColor: kPrimaryColor,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           remember = value;
                        //         });
                        //       },
                        //     ),
                        //     Text("Ingat Saya"),
                        //   ],
                        // ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        DefaultButton(
                          text: "Login",
                          press: () {
                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
                            context.bloc<LoginMemberBloc>().add(
                                LoginMemberButtonPressed(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    client_id: "test"));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun? ",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16)),
                      ),
                      GestureDetector(
                        onTap: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => RegisterPage()))
                        },
                        child: Text(
                          "Buat Akun",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<LoginMemberBloc, LoginMemberState>(
                      builder: (context, state) {
                    if (state is LoginMemberLoading) {
                      return Center(child: const CircularProgressIndicator());
                    } else if (state is LoginMemberRequestSuccess) {
                      // var data = json.decode(state.login);
//
                      var getLoginData = ResultLogin.fromJson(state.login);

                      // if (state.user.data.tableno == "Test") {
                      //   return Center(
                      //       child: Text(
                      //           "No meja tidak ditemukan. Mohon pindai ulang QR Code"));
                      // } else {}
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        setState(() async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          await pref.setString(
                              'token', getLoginData.data.access_token);
                          // await pref.setString(
                          //     'phonenumber', state.user.data.phonenumber);
                          // await pref.setString(
                          //     'tableno', state.user.data.tableno);
                          // await pref.setString('todo', state.user.todo);
                          // await pref.setString('branch_id', "FB01");
                        });
                      });
                      if (getLoginData.status == "true") {
                        context
                            .watch<LoginMemberBloc>()
                            .add(NavigateToHomePage());
                      }

                      if (getLoginData.todo == "activate") {
                        context
                            .watch<LoginMemberBloc>()
                            .add(NavigateToVerifyPage());
                      }

                      return Center(child: Text(getLoginData.message));
                    } else if (state is LoginMemberFailure) {
                      return Center(child: Text(state.error));
                    }
                    return Center(child: Text(""));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Scaffold(
// backgroundColor: Colors.white,
// body: Container(
// padding: EdgeInsets.symmetric(horizontal: 24),
// child: ListView(
// children: <Widget>[
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// SizedBox(
// height: 30,
// ),
// Container(
// margin: EdgeInsets.only(top: 70, bottom: 40),
// child: Text(
// "Lomeca",
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// ),
// ),
// TextField(
// controller: emailController,
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// labelText: "Email Address",
// hintText: "Email Address"),
// ),
// SizedBox(
// height: 16,
// ),
// TextField(
// controller: passwordController,
// obscureText: true,
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// labelText: "Password",
// hintText: "Password"),
// ),
// SizedBox(
// height: 6,
// ),
// Container(
// width: double.infinity,
// height: 40,
// child: ElevatedButton(
// onPressed: () {
// setState(() {
// context.bloc<RedeemCouponBloc>().add(FetchRedeemCoupon(token: getToken));
// // context.bloc<LoginMemberBloc>().add(LoginMemberButtonPressed(
// //   email: emailController.text,
// //   password: passwordController.text,
// //   client_id: "test"
// // ));
// });
// },
// child: Text('Login'),
// ),
// ),
// Row(
// children: <Widget>[
// Text(
// "Belum Punya Akun?",
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: accentColor3),
// ),
// Text(
// "Sign Up",
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
// )
// ],
// ),
// // BlocBuilder<RedeemCouponBloc, RedeemCouponState>(builder: (context, state) {
// //   if (state is RedeemCouponLoading) {
// //     return Center(child: const CircularProgressIndicator());
// //   } else if (state is RedeemCouponLoaded) {
// //
// //     // var data = json.decode(state.login);
// //     //
// //     var getRedeem = ResultRedeem.fromJson(state.data);
// //
// //
// //     // if (state.user.data.tableno == "Test") {
// //     //   return Center(
// //     //       child: Text(
// //     //           "No meja tidak ditemukan. Mohon pindai ulang QR Code"));
// //     // } else {
// //     //
// //     // }
// //     // SchedulerBinding.instance.addPostFrameCallback((_) {
// //     //   setState(() async {
// //     //     SharedPreferences pref =
// //     //     await SharedPreferences.getInstance();
// //     //     await pref.setString(
// //     //         'token', getLoginData.data.access_token);
// //     //     // await pref.setString(
// //     //     //     'phonenumber', state.user.data.phonenumber);
// //     //     // await pref.setString(
// //     //     //     'tableno', state.user.data.tableno);
// //     //     // await pref.setString('todo', state.user.todo);
// //     //     // await pref.setString('branch_id', "FB01");
// //     //   });
// //     //
// //     // });
// //     // context
// //     //     .watch<LoginMemberBloc>()
// //     //     .add(NavigateToHomePage());
// //     return Center(child: Text(getRedeem.message));
// //
// //   } else if (state is RedeemCouponError) {
// //     return Center(child: Text(state.errorMessage));
// //   }
// //   return Center(child: Text(""));
// // })
// BlocBuilder<LoginMemberBloc, LoginMemberState>(builder: (context, state) {
// if (state is LoginMemberLoading) {
// return Center(child: const CircularProgressIndicator());
// } else if (state is LoginMemberRequestSuccess) {
//
// // var data = json.decode(state.login);
// //
// var getLoginData = ResultLogin.fromJson(state.login);
//
//
// // if (state.user.data.tableno == "Test") {
// //   return Center(
// //       child: Text(
// //           "No meja tidak ditemukan. Mohon pindai ulang QR Code"));
// // } else {
// //
// // }
// // SchedulerBinding.instance.addPostFrameCallback((_) {
// //   setState(() async {
// //     SharedPreferences pref =
// //     await SharedPreferences.getInstance();
// //     await pref.setString(
// //         'token', getLoginData.data.access_token);
// //     // await pref.setString(
// //     //     'phonenumber', state.user.data.phonenumber);
// //     // await pref.setString(
// //     //     'tableno', state.user.data.tableno);
// //     // await pref.setString('todo', state.user.todo);
// //     // await pref.setString('branch_id', "FB01");
// //   });
// //
// // });
// // context
// //     .watch<LoginMemberBloc>()
// //     .add(NavigateToHomePage());
// return Center(child: Text(getLoginData.message));
//
// } else if (state is LoginMemberFailure) {
// return Center(child: Text(state.error));
// }
// return Center(child: Text(""));
// })
// ],
// ),
// ],
// ),
// ),
// );
