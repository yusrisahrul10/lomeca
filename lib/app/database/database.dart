import 'package:moor/moor.dart';

export 'package:ancol_taking_order/app/database/construct/shared.dart';

part 'database.g.dart';

@DataClassName("ItemCart")
class Cart extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get menuid => text()();

  TextColumn get ref_menuid => text().nullable()();

  TextColumn get image => text()();

  TextColumn get name => text()();

  RealColumn get price => real()();

  RealColumn get qty => real()();

  IntColumn get seqno => integer()();

  IntColumn get detailseqno => integer()();

  IntColumn get strukno => integer().nullable()();
}

@DataClassName("AdditionalMenuTemp")
class AdditionalMenu extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get menuid => integer()();

  IntColumn get ref_menuid => integer()();

  IntColumn get seqno => integer()();

  IntColumn get detailseqno => integer()();

  TextColumn get menuname => text()();

  IntColumn get qty => integer()();

  RealColumn get hjual => real()();

  TextColumn get menupict => text()();
}

@DataClassName("Order")
class TransactionOrder extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get strukno => text()();

  RealColumn get total_price => real()();
}

@DataClassName("OrderDetail")
class TransactionOrderDetail extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get strukno => text()();

  IntColumn get menuid => integer()();

  RealColumn get ref_menuid => real().nullable()();

  IntColumn get seqno => integer()();

  IntColumn get detailseqno => integer()();

  TextColumn get menuname => text()();

  IntColumn get qty => integer()();

  RealColumn get hjual => real()();

  TextColumn get menupict => text()();
}

@UseMoor(tables: [
  Cart,
  AdditionalMenu,
  TransactionOrder,
  TransactionOrderDetail
], queries: {
  'updateQtyMenu': 'UPDATE cart SET qty = qty + 1 WHERE menuid = :id;',
  'decreaseQtyMenu': 'UPDATE cart SET qty = qty - 1 WHERE menuid = :id;',
  'deleteMenu': 'DELETE FROM cart WHERE seqno = :seqno',
  'getOrderDetail': 'SELECT * FROM transaction_order_detail WHERE strukno = :strukno',
  'getOrderDetailTotalAmount': 'SELECT SUM(hjual * qty) AS totalamount FROM transaction_order_detail WHERE strukno = :strukno;'
})
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(cart, cart.menuid);
          await m.addColumn(cart, cart.seqno);
          await m.addColumn(cart, cart.detailseqno);
        }

        if (from <= 2) {
          await m.addColumn(cart, cart.ref_menuid);
          await m.createTable(additionalMenu);
        }

        if (from <= 3) {
          await m.alterTable(TableMigration(cart, columnTransformer: {
            cart.ref_menuid: cart.ref_menuid.cast<int>(),
          }));
        }

        if (from <= 4) {
          await m.alterTable(TableMigration(cart, columnTransformer: {
            cart.qty: cart.qty.cast<double>(),
          }));
        }

        if (from <= 5) {
          await m.addColumn(cart, cart.strukno);
        }

        if (from <= 6) {
          await m.alterTable(TableMigration(cart, columnTransformer: {
            cart.strukno: cart.strukno.cast<int>(),
          }));
          await m.createTable(transactionOrder);
          await m.createTable(transactionOrderDetail);
        }

        if (from <= 7) {
          await m.alterTable(
              TableMigration(transactionOrderDetail, columnTransformer: {
            transactionOrderDetail.ref_menuid: cart.ref_menuid.cast<double>(),
          }));
        }

        if (from <= 8) {
          await m.alterTable(TableMigration(cart, columnTransformer: {
            cart.menuid: cart.menuid.cast<String>(),
            cart.ref_menuid: cart.ref_menuid.cast<String>()
          }));
        }

      });

  Stream<double> getTotal() {
    final avgLength = (cart.qty * cart.price).sum();

    final query = selectOnly(cart)..addColumns([avgLength]);

    return query.map((row) => row.read(avgLength)).watchSingle();
  }

  Stream<List<ItemCart>> watchAllOrder() => select(cart).watch();

  Future insertNewOrder(ItemCart itemCart) => into(cart).insert(itemCart);

  Future deleteCart(ItemCart itemCart) => delete(cart).delete(itemCart);

  Future deleteAllCart() => delete(cart).go();

}
