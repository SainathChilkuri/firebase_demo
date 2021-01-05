import 'package:firebase_demo/Model/order_details.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'database_helper.g.dart';

class OrderDetailsTable extends Table{
  IntColumn get quantity => integer()();
  IntColumn get totalPrice => integer()();
  IntColumn get orderID=> integer().autoIncrement()();
 TextColumn get custId => text()();
 TextColumn get productName => text()();
 TextColumn get productCategory => text()();
 TextColumn get productDesc => text()();
 BoolColumn get isDelivered => boolean().withDefault(Constant(false))();
 IntColumn get price => integer()();
 TextColumn get category => text()();
 TextColumn get imageURL =>text()();
}
class Plan extends Table{
  TextColumn get UID => text()();
  IntColumn get timestamp => integer()();
  TextColumn get planID => text()();
  RealColumn get enteredAmount => real()();
  RealColumn get currentSlidervalue => real()();
  RealColumn get firstEMI => real()();
  RealColumn get nineMonthsEMI => real()();
  RealColumn get lastEMI => real()();
  RealColumn get totalPurchase => real()();
  RealColumn get yourSavings => real()();
  @override
  Set<Column> get primaryKey =>{planID};
}

@UseMoor(tables: [OrderDetailsTable,Plan],daos: [OrdersDao,PlanDao])
class AppBase extends _$AppBase{
AppBase():super(FlutterQueryExecutor.inDatabaseFolder(path: 'db1.sqlite',logStatements: true ));

  @override
  int get schemaVersion => 1;



}
@UseDao(tables: [Plan])
class PlanDao extends DatabaseAccessor<AppBase> with _$PlanDaoMixin{
  final AppBase db;
  PlanDao(
    this.db
):super(db);
Future<int> insertPlanTable(PlanData planData) => into(plan).insert(planData);
Future<List<PlanData>> getPlanData(String UID)=> (select(plan)..
      where((t) => t.UID.equals(UID))).get();
}
@UseDao(tables: [OrderDetailsTable])
class OrdersDao extends DatabaseAccessor<AppBase> with _$OrdersDaoMixin{
  final AppBase db;
  OrdersDao(this.db) : super(db);
  Future<List<OrderDetailsTableData>> getOrderDetails(String custid) async {
    return await (select(orderDetailsTable)
      ..where(
              (t) => t.custId.equals(custid))).get();
  }
  Future<int> insertOrderDetails(OrderDetailsTableData orders) => into(orderDetailsTable).insert(orders);
  Future<int> deleteOrderDetails(OrderDetailsTableData orders) => delete(orderDetailsTable).delete(orders);
}
