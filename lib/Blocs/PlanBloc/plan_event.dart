import 'package:equatable/equatable.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:flutter/cupertino.dart';

abstract class PlanEvent extends Equatable{
  @override
  List<Object> get props =>[];
}
class PlanInitialLoadData extends PlanEvent{
  final String UID;
  PlanInitialLoadData({
    @required this.UID
}):assert(UID!=null);

  @override
  List<Object> get props=> [UID];
}
class PlanInsertEvent extends PlanEvent{
  final PlanData planData;
  PlanInsertEvent({
    @required this.planData
}):assert(planData!=null);

  @override
  List<Object> get props=>[planData];
}