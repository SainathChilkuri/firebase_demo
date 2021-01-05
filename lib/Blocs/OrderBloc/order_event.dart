import 'package:equatable/equatable.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:firebase_demo/Model/order_details.dart';
import 'package:flutter/cupertino.dart';

abstract class OrderEvents extends Equatable{

  @override
  List<Object> get props =>[];
}
class OrderInitialDataLoad extends OrderEvents{
  final String UID;
  OrderInitialDataLoad({
    @required this.UID
}):assert(UID!=null);
  @override
  List<Object> get props=>[UID];
}
class OrderInsertEvent extends OrderEvents{
  final OrderDetailsTableData orderDetail;
  OrderInsertEvent({
    this.orderDetail
}):assert(orderDetail!=null);
  @override
  List<Object> get props=>[orderDetail];
}
class OrderDeleteEvent extends OrderEvents{
  final OrderDetailsTableData orderDetailsTableData;
  OrderDeleteEvent({
    @required this.orderDetailsTableData
}): assert(orderDetailsTableData!=null);
  @override
  List<Object> get props=>[orderDetailsTableData];
}