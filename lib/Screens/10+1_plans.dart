import 'dart:math';

import 'package:firebase_demo/Blocs/PlanBloc/plan_bloc.dart';
import 'package:firebase_demo/Blocs/PlanBloc/plan_event.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:firebase_demo/Model/plan_model.dart';
import 'package:firebase_demo/Session/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PlanScreen extends StatefulWidget {
  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  String planID;
  double enteredAmount = 0.0;
  double currentSlidervalue = 1000.0;
  double firstEMI = 0.0;
  double nineMonthsEMI = 0.0;
  double lastEMI = 0.0;
  double totalPurchase = 0.0;
  double yourSavings = 0.0;
  int randNo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     randNo = Random().nextInt(1000);
     print(randNo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "10 + 1 Plan"
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: (){
                showDialog(
                    context:(context),
                builder: (builder){
                    return AlertDialog(
                      content: Container(
                        height: 100.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1. 50% off on First EMI"),
                            Text("2. Remaining Nine Months EMI have to be paid"),
                            Text("3. 100% applied for the last EMI")
                          ],
                        ),
                      ),
                    );
                });
              })
        ],
      ),
        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _planIdGenerate(),
            _amountText(),
            _sliderValue(),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Card(
                elevation: 6.0,
                child: Column(
                  children: [
                    _firstEMI(),
                    _nineEMI(),
                    _lastEMI()
                  ],
                ),
              ),
            ),
            Divider(),
            Text(
              "Total Purchase",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0
              ),
            ),
            Container(
              height: 60,
              width: 200,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 9.0),
              decoration: BoxDecoration(
                  color: Colors.pink,
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Text(
                " Rs ${totalPurchase}",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),)
              ),
            Divider(),
            _savingAmount(),
            _saveThePlan()
          ],
        )
    );
  }

 Widget _amountText() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Text(
        "Rs. ${enteredAmount}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30.0
        ),
      ),
    );
 }
  Widget _sliderValue() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Slider(
          value: currentSlidervalue,
        min: 1000.0,
        max: 20000.0,
        divisions: 20,
        onChanged: (double value){
            setState(() {
              currentSlidervalue = value;
              enteredAmount = currentSlidervalue;
              _calculateEMI(currentSlidervalue);
              print(currentSlidervalue);
            });
        },
        activeColor: Colors.pink,
        inactiveColor: Colors.black38,
      ),
    );
  }

  Widget _firstEMI() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("First EMI :",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),),
          Text("Rs. ${firstEMI.roundToDouble()}",
          )
        ],
      ),
    );
  }

 Widget _nineEMI() {
   return Container(
     margin: EdgeInsets.all(10.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text("Nine Months EMI :",
       style: TextStyle(
           color: Colors.black,
           fontWeight: FontWeight.bold,
           fontSize: 20.0
       )),
         Text("Rs. ${nineMonthsEMI.roundToDouble()}")
       ],
     ),
   );
 }

  Widget _lastEMI() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Last EMI :",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        )),
          Text("Rs. ${lastEMI.roundToDouble()}")
        ],
      ),
    );
  }

  void _calculateEMI(double currentSlidervalue) {
    var value = currentSlidervalue;
    setState(() {
      firstEMI = (value*0.50);
      nineMonthsEMI = value*9;
      lastEMI = value;
      totalPurchase = value*11;
      yourSavings = totalPurchase - (firstEMI + nineMonthsEMI);
    });
  }

 Widget _savingAmount() {
   return Container(
     alignment: Alignment.center,
     margin: EdgeInsets.all(10.0),
     child: Row(
       children: [
         Text("Your Savings: ",
             style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 20.0
             )),
         Text("Rs. ${yourSavings.roundToDouble()}")
       ],
     ),
   );
 }

  Widget _planIdGenerate() {
    setState(() {
      planID = "PlanID-$randNo/" +"${DateTime.now().day}";
    });
    return Container(
      child: Text(
        "$planID"
      ),
    );
  }

  Widget _saveThePlan() {
    return InkWell(
      onTap: (){
        print("Save Plan");
        _savetoPlanTable();
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        height: 60.0,
        alignment: Alignment.center,
        child: Text(
          "Save the Plan"
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purpleAccent,
              Colors.pink
            ]
          )
        ),
      ),
    );
  }
  void _savetoPlanTable() {
    UserSession.getSession().then((value){
      print(DateTime.now().millisecondsSinceEpoch);
      print(value.UID);
      var plan = PlanData(UID: value.UID, timestamp:DateTime.now().millisecondsSinceEpoch, planID: planID, enteredAmount: enteredAmount, currentSlidervalue: currentSlidervalue, firstEMI: firstEMI, nineMonthsEMI: nineMonthsEMI, lastEMI: lastEMI, totalPurchase: totalPurchase, yourSavings: yourSavings);
      BlocProvider.of<PlanBloc>(context).add(PlanInsertEvent(planData: plan));

    });

  }
}




