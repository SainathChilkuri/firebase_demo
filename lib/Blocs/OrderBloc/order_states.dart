import 'package:equatable/equatable.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:firebase_demo/Model/order_details.dart';
import 'package:moor_flutter/moor_flutter.dart';

abstract class OrderState extends Equatable{
  @override
  List<Object> get props=>[];
}
class OrderInitialState extends OrderState{}
class OrderEmptyState extends OrderState{}
class OrderSuccesfull extends OrderState{}
class OrderLoadState extends OrderState{
  final List<OrderDetailsTableData> orderDetail;
  OrderLoadState({
    this.orderDetail
}):assert(orderDetail !=null);

  @override
  List<Object> get props => [orderDetail];
}
class OrderLoadFailState extends OrderState{
}