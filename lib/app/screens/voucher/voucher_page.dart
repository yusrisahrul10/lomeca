import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_bloc.dart';
import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_event.dart';
import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_state.dart';
import 'package:ancol_taking_order/app/database/database.dart';
import 'package:ancol_taking_order/app/models/voucher.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {

  String token = "";


  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });

    context.bloc<MemberVoucherBloc>().add(FetchMemberVoucher(token: token));

  }

  @override
  void initState() {
    super.initState();

    getToken();
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
          'Your Voucher',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        child: buildBody(),
      ),
    );
  }



  Widget buildBody() {
    final openDb = constructDb();

    return BlocBuilder<MemberVoucherBloc, MemberVoucherState>(
      builder: (context, state) {
        if (state is MemberVoucherLoaded) {
          var getVoucherData = ResultVoucher.fromJson(state.data);
          List<DataVoucher> listVoucher = getVoucherData.data;

          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listVoucher.length,
              itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(top: index == 0 ? 133 : 20, bottom: index == listVoucher.length - 1 ? 100: 8 ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                    child: Card(
                      elevation: 3,
                      clipBehavior: Clip.antiAlias,
                      child: Ink(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRect(
                                  child: RepositoryProvider<Database>(
                                    create: (context) => constructDb(),
                                    child: InkWell(
                                      child: Image.network(
                                        listVoucher[index].voucher_banner_image_path,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.25,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        color: Colors.black38,
                                        colorBlendMode: BlendMode.multiply,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Database(openDb.executor).insertNewOrder(ItemCart(
                                            // strukno: getStrukno(),
                                              menuid: "999",
                                              image: "",
                                              name: listVoucher[index].voucher_title,
                                              price: -listVoucher[index].voucher_amount.toDouble(),
                                              qty: 1,
                                              seqno: 999,
                                              detailseqno: 0));
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: ListTile(
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Nominal Voucher: \n${listVoucher[index].voucher_amount}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )));
        } else if (state is MemberVoucherLoading) {
          return Center(child: const CircularProgressIndicator());
        } else if (state is MemberVoucherError) {
          return Center(child: Text(state.errorMessage));
        }
        return Center(child: Text(""));
      });
    }
}
