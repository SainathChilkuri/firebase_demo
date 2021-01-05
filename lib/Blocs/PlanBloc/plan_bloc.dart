import 'package:firebase_demo/Blocs/PlanBloc/plan_event.dart';
import 'package:firebase_demo/Blocs/PlanBloc/plan_state.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanBloc extends Bloc<PlanEvent,PlanState>{
  PlanBloc() : super(PlanInitialState());

  @override
  Stream<PlanState> mapEventToState(PlanEvent event) async* {
    if(event is PlanInitialLoadData){
      yield PlanLoading();
      var result =await AppBase().planDao.getPlanData(event.UID);
      if(result != 0){
       print("Retrieved");
       print(result);
       yield PlanSuccesfullLoadState(planData: result);
      }else{
        yield PlanLoadFail();
      }
    }
   if(event is PlanInsertEvent){
     yield PlanLoading();
     var result = await AppBase().planDao.insertPlanTable(event.planData);
     if(result != 0){
       print("Inserted");
       var result =await AppBase().planDao.getPlanData(event.planData.UID);
       if(result!=null){
         yield  PlanSuccesfullLoadState(planData: result);
       }else{
         yield PlanLoadFail();
       }
     }else{
       yield PlanLoadFail();
     }
   }
  }

}