import 'package:equatable/equatable.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:flutter/cupertino.dart';

abstract class PlanState extends Equatable{
  @override
  List<Object> get props =>[];
}
class PlanInitialState extends PlanState{}
class PlanLoading extends PlanState{}
class PlanSuccesfullyInserted extends PlanState{}
class PlanSuccesfullLoadState extends PlanState{
  final List<PlanData> planData;
  PlanSuccesfullLoadState({
    @required this.planData
  }):assert(planData!=null);

  @override
  List<Object> get props => [planData];
}
class PlanSuccessfullyDeleted extends PlanState{}
class PlanLoadFail extends PlanState{}