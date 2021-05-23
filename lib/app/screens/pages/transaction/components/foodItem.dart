import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/models/restomenus.dart';
import 'package:ancol_taking_order/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:ancol_taking_order/app/screens/pages/menudetail/menu_detail.dart';


class FoodItem extends StatelessWidget {
  final Menu food;

  FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => MenuDetails(restoMenu: this.food,))),
      child: Container(
        margin: EdgeInsets.only(right: 20, bottom: 20),
        height: 200,
        width: size.width / 2,
        child: Stack(
          children: <Widget>[buildCard(), buildImage(size)],
        ),
      ),
    );
  }

  Widget buildImage(Size size) {
    if (food.menupict.isNotEmpty) {
      return Image.network(
        food.menupict,
        width: 110,
      );
    } else {
      return Image.asset(
        'images/Avocado_Salad.png',
        width: 110,
      );
    }
  }

  Widget buildCard() {
    return Container(
      constraints: BoxConstraints(minHeight: 110, minWidth: 200),
      //padding: EdgeInsets.only(top: 16),
      margin: EdgeInsets.only(top: 5, left: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            buildIcon(),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'Rp. ${food.sellingprice.toString()}',
                style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                food.menuname,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                food.menuname1,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Row(
      children: <Widget>[
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
              color: mainColorDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Image.asset(
            'images/Heart.png',
            width: 25,
            color: mainBlue,
          ),
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
