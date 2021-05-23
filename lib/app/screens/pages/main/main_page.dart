import 'package:ancol_taking_order/app/screens/pages/main/coupon/coupon_page.dart';
import 'package:ancol_taking_order/app/screens/pages/main/home/home_page.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:ancol_taking_order/app/utils/coustom_bottom_nav_bar.dart';
import 'package:ancol_taking_order/app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isRedeem;

  MainPage({this.bottomNavBarIndex = 0, this.isRedeem = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F7F9),
        body: Stack(
          children: [
            Container(color: accentColor1,),
            SafeArea(child: Container(color: Color(0xFFF6F7F9),
            ),
            ),
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
              children: [
                HomePage(),
                CouponPage()
              ],
            ),
            createCustomBottomNavBar(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.only(bottom: 42),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: kPrimaryColor,
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(MdiIcons.cart, color: Colors.black.withOpacity(0.54),
                    ),
                  ),
                  onPressed: () {
                    // context.bloc<UserBloc>().add(SignOut());
                    // AuthServices.signOut();
                    // context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
                    Navigator.of(context).pushNamed('/new_order_page');
                  },
                ),
              ),
            )
          ],
        )
    );
  }


  Widget createCustomBottomNavBar() => Align(
    alignment: Alignment.bottomCenter,
    child: ClipPath(
      clipper: BottomNavBarClipper(),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Color(0xFFFF7643),
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
                  child: Image.asset((bottomNavBarIndex == 0) ? "images/home_orange.png" : "images/home.png"),
                )
            ),
            BottomNavigationBarItem(
                label: 'My Voucher',
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
                  child: Image.asset((bottomNavBarIndex == 1) ? "images/voucher_orange.png" : "images/voucher.png"),
                )
            ),
          ],
          selectedLabelStyle: GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w600),
          unselectedItemColor: Color(0xFF757575),
          currentIndex: bottomNavBarIndex,
          onTap: (index) {
            setState(() {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            });
          },
        ),
      ),
    ),
  );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}