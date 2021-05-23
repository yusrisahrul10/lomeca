import 'package:ancol_taking_order/app/bloc/register/register_bloc.dart';
import 'package:ancol_taking_order/app/bloc/register/register_event.dart';
import 'package:ancol_taking_order/app/bloc/register/register_state.dart';
import 'package:ancol_taking_order/app/models/register.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController noTelpController= TextEditingController();
  TextEditingController addressController = TextEditingController();

  int _radioValue = -1;

  String gender;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          gender = "0";
          break;
        case 1:
          gender = "1";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(true);

          return true;
        },
        child: Scaffold(
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 22),
                        height: 56,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back, color: Colors.black),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Full Name",
                            hintText: "Full Name"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Email",
                            hintText: "Email"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                            hintText: "Password"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Confirm Password",
                            hintText: "Confirm Password"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: noTelpController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "No Telepon",
                            hintText: "No Telepon"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Jenis Kelamin',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text(
                            'Laki-laki',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text(
                            'Perempuan',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: addressController,
                        maxLines: 3,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Alamat",
                            hintText: "Alamat"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FloatingActionButton(
                          child: Icon(Icons.arrow_forward),
                          backgroundColor: kPrimaryColor,
                          elevation: 0,
                          onPressed: () {
                            context.bloc<RegisterBloc>().add(
                              RegisterButtonPressed(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                passwordConfirmation: confirmPasswordController.text,
                                phonenumber: noTelpController.text,
                                gender: gender,
                                address: addressController.text
                              )
                            );
                          }),

                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          if (state is RegisterLoading) {
                            return Center(child: const CircularProgressIndicator());
                          } else if (state is RegisterRequestSuccess) {

                            var getRegisterData = ResultRegister.fromJson(state.register);

                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              setState(() async {
                                SharedPreferences pref =
                                await SharedPreferences.getInstance();
                                await pref.setString(
                                    'token', getRegisterData.data.access_token);
                              });
                            });
                            if (getRegisterData.status == "true") {
                              context.bloc<RegisterBloc>().add(NavigateToVerifyPage());
                              context.bloc<RegisterBloc>().add(NavigateActionRegisterPop());
                            }
                            return Center(child: Text(getRegisterData.message));

                          } else if (state is RegisterFailure) {
                            return Center(child: Text(state.error));
                          }
                          return Center(child: Text(""));
                        },
                      )
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}
