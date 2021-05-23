import 'package:ancol_taking_order/app/models/restomenus.dart';
import 'package:ancol_taking_order/app/models/restomenusadd.dart';

class RestoMenuRepository {
  List<RestoMenu> getPopularMenu() {
    List<RestoMenu> list = [];
    list.add(RestoMenu(101, 'images/Salmon_Sushi.png', 'Salmon Sushi',
        'Salmon, carrot rolls, \nspinach and some sauce.', false, 28000, 1, 1));
    list.add(RestoMenu(102, 'images/Avocado_Salad.png', 'Avocado Salad',
        'Fresh hamburger with \nchicken, salad, tomatoes.', true, 11000, 1, 1));
    list.add(RestoMenu(103, 'images/Salmon_Sushi.png', 'Salmon Sushi',
        'Salmon, carrot rolls, \nspinach and some sauce.', false, 28000, 1, 1));
    list.add(RestoMenu(104, 'images/Avocado_Salad.png', 'Avocado Salad',
        'Fresh hamburger with \nchicken, salad, tomatoes.', true, 11000, 1, 1));
    list.add(RestoMenu(111, 'images/krupuk.jpg', 'Kerupuk',
        '', true, 1000, 0, 0));
    list.add(RestoMenu(112, 'images/sambal.jpg', 'Sambal',
        '', true, 2000, 0, 0));
    return list;
  }

  List<RestoMenuAdd> getMenuTambahan() {
    List<RestoMenuAdd> list = [];
    list.add(RestoMenuAdd(101, 111, 1000));
    list.add(RestoMenuAdd(101, 111, 2000));
    return list;
  }
}
