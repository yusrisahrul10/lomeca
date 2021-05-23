import 'package:ancol_taking_order/app/models/restomenus.dart';
import 'package:ancol_taking_order/app/models/trxorder.dart';

class TransactionRepository {
  List<TrxOrder> getOrderedMenu() {
    List<TrxOrder> list = [];

    // RestoMenu item = RestoMenu('images/Salmon_Sushi.png', 'Salmon Sushi',
    //     'Salmon, carrot rolls, \nspinach and some sauce.', false, 28000);
    // list.add(TrxOrder(item, 1));
    //
    // RestoMenu item2 = RestoMenu('images/Avocado_Salad.png', 'Avocado Salad',
    //     'Fresh hamburger with \nchicken, salad, tomatoes.', true, 11000);
    // list.add(TrxOrder(item2, 1));

    return list;
  }
}
