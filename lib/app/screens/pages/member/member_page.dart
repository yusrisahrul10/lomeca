import 'package:ancol_taking_order/app/bloc/loginmember/login_member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_event.dart';
import 'package:ancol_taking_order/app/bloc/logout/logout_bloc.dart';
import 'package:ancol_taking_order/app/bloc/logout/logout_event.dart';
import 'package:ancol_taking_order/app/bloc/logout/logout_state.dart';
import 'package:ancol_taking_order/app/bloc/member/member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/member/member_event.dart';
import 'package:ancol_taking_order/app/bloc/member/member_state.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_bloc.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_event.dart';
import 'package:ancol_taking_order/app/models/member.dart';
import 'package:ancol_taking_order/app/utils/default_button.dart';
import 'package:ancol_taking_order/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  String token;

  _getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<MemberBloc>().add(FetchMember(token: token));
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(true);

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                BlocBuilder<MemberBloc, MemberState>(
                  builder: (context, state) {
                    if (state is MemberLoaded) {
                      var getMemberData = ResultMember.fromJson(state.data);

                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 22, bottom: 10),
                            width: 90,
                            height: 104,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: (NetworkImage(
                                                getMemberData.data.profile_pict)),
                                            fit: BoxFit.cover))),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                      // if (profilePath == "") {
                                      //   profileImageFile = await getImage();
                                      //
                                      //   if (profileImageFile != null) {
                                      //     profilePath =
                                      //         basename(profileImageFile.path);
                                      //   }
                                      // } else {
                                      //   profileImageFile = null;
                                      //   profilePath = "";
                                      // }
                                      //
                                      // setState(() {
                                      //   isDataEdited =
                                      //   (nameController.text.trim() !=
                                      //       widget.user.name ||
                                      //       profilePath !=
                                      //           widget.user.profilePicture)
                                      //       ? true
                                      //       : false;
                                      // });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Poin saat ini: " + getMemberData.data.point.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),

                          SizedBox(
                            height: 16,
                          ),

                          AbsorbPointer(
                            child: TextField(
                              controller:
                              TextEditingController(text: getMemberData.data.member_name),
                              style: TextStyle(
                                  color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Nama Lengkap",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AbsorbPointer(
                            child: TextField(
                              controller:
                              TextEditingController(text: getMemberData.data.member_email),
                              style: TextStyle(
                                  color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Email",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AbsorbPointer(
                            child: TextField(
                              controller:
                              TextEditingController(text: getMemberData.data.phone_number),
                              style: TextStyle(
                                  color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "No Telepon",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AbsorbPointer(
                            child: TextField(
                              controller:
                              TextEditingController(text: getMemberData.data.gender_name),
                              style: TextStyle(
                                  color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Jenis Kelamin",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AbsorbPointer(
                            child: TextField(
                              controller:
                              TextEditingController(text: getMemberData.data.address),
                              style: TextStyle(
                                  color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Alamat",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DefaultButton(
                            text: "Logout",
                            press: () {
                              context.bloc<LogoutBloc>().add(LogoutButtonPressed(
                                token: token
                              ));
                            },
                          ),
                        ],
                      );
                    } else if (state is MemberLoading) {
                      return Center(child: const CircularProgressIndicator());
                    } else if (state is MemberError) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return Center(child: Text(""));
                  },
                ),
                BlocBuilder<LogoutBloc, LogoutState>(
                  builder: (context, state) {
                    if (state is LogoutRequestSuccess) {
                      var getMemberData = ResultMember.fromJson(state.logout);

                      context.bloc<LogoutBloc>().add(NavigateToLoginPage());
                      context.bloc<LoginMemberBloc>().add(NavigatorActionLogin());
                      // context.bloc<PromoBloc>().add(NavigatorActionPromoPop());

                      return Center(child: Text(getMemberData.message));

                    } else if (state is LogoutLoading) {
                      return Center(child: const CircularProgressIndicator());
                    } else if (state is LogoutFailure) {
                      return Center(child: Text(state.error));
                    }
                    return Center(child: Text(""));
                  },
                ),
              ],
            ),
          ),
          SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 20, left: defaultMargin),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
