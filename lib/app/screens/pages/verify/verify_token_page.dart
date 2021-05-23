import 'package:ancol_taking_order/app/bloc/loginmember/login_member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_event.dart';
import 'package:ancol_taking_order/app/bloc/register/register_bloc.dart';
import 'package:ancol_taking_order/app/bloc/register/register_event.dart';
import 'package:ancol_taking_order/app/bloc/verify/verify_token_bloc.dart';
import 'package:ancol_taking_order/app/bloc/verify/verify_token_event.dart';
import 'package:ancol_taking_order/app/bloc/verify/verify_token_state.dart';
import 'package:ancol_taking_order/app/models/register.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyTokenPage extends StatefulWidget {
  @override
  _VerifyTokenPageState createState() => _VerifyTokenPageState();
}

class _VerifyTokenPageState extends State<VerifyTokenPage> {
  TextEditingController tokenController = TextEditingController();

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
                    "Activate Your Account",
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
                          controller: tokenController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Activation Token",
                              hintText: "Activation Token"),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        DefaultButton(
                          text: "Verify",
                          press: () {
                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
                            context.bloc<VerifyTokenBloc>().add(
                                VerifyTokenButtonPressed(
                                    verifyMember: tokenController.text,
                                    token: getToken,));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  BlocBuilder<VerifyTokenBloc, VerifyTokenState>(
                      builder: (context, state) {
                        if (state is VerifyTokenLoading) {
                          return Center(child: const CircularProgressIndicator());
                        } else if (state is VerifyTokenRequestSuccess) {
                          var getRegisterData = ResultRegister.fromJson(state.register);

                          if (getRegisterData.status == "true") {
                            context.bloc<VerifyTokenBloc>().add(NavigateToLoginPage());
                            context.bloc<LoginMemberBloc>().add(NavigatorActionLogin());
                          }
                          return Center(child: Text(getRegisterData.message));
                        } else if (state is VerifyTokenFailure) {
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
