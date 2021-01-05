import 'package:firebase_demo/Blocs/PlanBloc/plan_bloc.dart';
import 'package:firebase_demo/Blocs/PlanBloc/plan_event.dart';
import 'package:firebase_demo/Blocs/PlanBloc/plan_state.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:firebase_demo/Session/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GoldMineScreen extends StatefulWidget {
  @override
  _GoldMineScreenState createState() => _GoldMineScreenState();
}

class _GoldMineScreenState extends State<GoldMineScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PlanBloc,PlanState>(
      listener: (context,state){
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("GoldMine Plans"),
        ),
        body: BlocBuilder<PlanBloc,PlanState>(
          // ignore: missing_return
          builder: (context,state){
            if(state is PlanInitialState){
              _loadData();
              return Container();
            }
            if(state is PlanLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is PlanSuccesfullLoadState){
               return _showListOfPlans(state.planData);
            }
            if(state is PlanLoadFail){
              return Center(
                child: Text("Sorry! Something Went Wrong")
              );
            }
          },
        ),
      ),
    );
  }
  void _loadData() {
    UserSession.getSession().then((value){
      BlocProvider.of<PlanBloc>(context).add(PlanInitialLoadData(UID: value.UID));
    });
  }

  Widget _showListOfPlans(List<PlanData> planData) {
    return ListView.builder(
      itemCount: planData.length,
        itemBuilder: (context,index){
        var plan = planData[index];
        return _showList(plan);
        });
  }

  Widget _showList(PlanData plan) {
    return ListTile(
      title: Text(plan.planID),
    );
  }
}

