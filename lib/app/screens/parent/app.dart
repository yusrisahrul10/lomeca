import 'package:ancol_taking_order/app/bloc/checkorder/check_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/closeorder/close_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/logout/logout_bloc.dart';
import 'package:ancol_taking_order/app/bloc/member/member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/membervoucher/member_voucher_bloc.dart';
import 'package:ancol_taking_order/app/bloc/membervoucherdetail/member_voucher_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/neworder/new_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/loginmember/login_member_bloc.dart';
import 'package:ancol_taking_order/app/bloc/mastermenu/master_menu_bloc.dart';
import 'package:ancol_taking_order/app/bloc/mastermenuadditional/master_menu_additional_bloc.dart';
import 'package:ancol_taking_order/app/bloc/mastermenufavorite/master_menu_favorite_bloc.dart';
import 'package:ancol_taking_order/app/bloc/postorder/post_order_bloc.dart';
import 'package:ancol_taking_order/app/bloc/promo/promo_bloc.dart';
import 'package:ancol_taking_order/app/bloc/promodetail/promo_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeem/redeem_coupon_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeemdetail/redeem_detail_bloc.dart';
import 'package:ancol_taking_order/app/bloc/redeemvoucher/redeem_voucher_bloc.dart';
import 'package:ancol_taking_order/app/bloc/register/register_bloc.dart';
import 'package:ancol_taking_order/app/bloc/verify/verify_token_bloc.dart';
import 'package:ancol_taking_order/app/database/database.dart';
import 'package:ancol_taking_order/app/repositories/api_repository.dart';
import 'package:ancol_taking_order/app/screens/pages/loginmember/login_member_page.dart';
import 'package:ancol_taking_order/app/screens/pages/main/home/home_page.dart';
import 'package:ancol_taking_order/app/screens/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/neworder/new_order_page.dart';
import 'package:fluro/fluro.dart';

import '../pages/neworder/new_order_page.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Database>(
      create: (context) => constructDb(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MasterMenuBloc(repository: ApiRepository())),
          BlocProvider(
              create: (context) =>
                  MasterMenuAdditionalBloc(repository: ApiRepository())),
          BlocProvider(
              create: (context) => NewOrderBloc(
                  repository: ApiRepository(), navigatorKey: _navigatorKey)),
          BlocProvider(create: (context) => PostOrderBloc(
              repository: ApiRepository(), navigatorKey: _navigatorKey)),
          BlocProvider(create: (context) => CheckOrderBloc(
              repository: ApiRepository())),
          BlocProvider(create: (context) => CloseOrderBloc(
              repository: ApiRepository(), navigatorKey: _navigatorKey)),
          BlocProvider(create: (context) => LoginMemberBloc(
            repository: ApiRepository(), navigatorKey: _navigatorKey
          )),
          BlocProvider(create: (context) => RedeemCouponBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => PromoBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => MemberBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => MemberVoucherBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => RedeemDetailBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => RegisterBloc(
              repository: ApiRepository(), navigatorKey: _navigatorKey
          )),
          BlocProvider(create: (context) => VerifyTokenBloc(
              repository: ApiRepository(), navigatorKey: _navigatorKey
          )),
          BlocProvider(create: (context) => MemberVoucherDetailBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => RedeemVoucherBloc(
              repository: ApiRepository(), navigatorKey: _navigatorKey
          )),
          BlocProvider(create: (context) => PromoDetailBloc(
              repository: ApiRepository()
          )),
          BlocProvider(create: (context) => LogoutBloc(
              repository: ApiRepository(), navigatorKey: _navigatorKey
          )),
          BlocProvider(
              create: (context) => MasterMenuFavoriteBloc(repository: ApiRepository())),
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'DiviPOS Taking Order',
          home: LoginMemberPage(),
          routes: <String, WidgetBuilder>{
            '/new_order_page': (BuildContext context) => NewOrderPage(),
            '/transaction_page': (BuildContext context) => TransactionPage(),
            '/finish_page': (BuildContext context) => NewOrderPage(),
            '/home_page': (BuildContext context) => HomePage(),
            '/login_page': (BuildContext context) => LoginMemberPage(),
          },
        ),
      ),
      // ),
    );
  }
}