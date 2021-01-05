import 'package:firebase_demo/Blocs/OrderBloc/order_bloc.dart';
import 'package:firebase_demo/Blocs/OrderBloc/order_event.dart';
import 'package:firebase_demo/Blocs/OrderBloc/order_states.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Screens/Pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OrderScreen extends StatefulWidget {
  final UserDetails userDetails;
  OrderScreen({
    this.userDetails
});
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc,OrderState>(
      listener: (context,state){
       /* if(state is OrderInitialState){
          return _loadData();
        }*/
      },
      child: Scaffold(
        body: BlocBuilder<OrderBloc,OrderState>(
          // ignore: missing_return
          builder: (context,state){
            if(state is OrderInitialState){
              _loadData();
              return Container();
            }
            if(state is OrderEmptyState){
              return Center(
                child: Text("No data Found"),
              );
            }
            if(state is OrderLoadState){
              return _listOfOrders(state.orderDetail);
            }
            if(state is OrderLoadFailState){
              return Center(
                child: Text(
                  "Sorry! Something Went Wrong"
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _listOfOrders(List<OrderDetailsTableData> orderDetail) {
    return ListView.builder(
        itemCount: orderDetail.length,
        itemBuilder: (context,index){
          return cardofOrders(orderDetail[index]);
        });
  }

  Widget cardofOrders(OrderDetailsTableData orderDetail) {
    return Container(
      child: Card(
        elevation: 6.0,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              orderDetail.imageURL
                          )
                      )
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(orderDetail.productName),
                    Text("Category: ${orderDetail.category}"),
                    Text("Price :${orderDetail.price} /-"),
                    Text("Quantity: ${orderDetail.quantity}"),
                    Text("Total Price: ${orderDetail.totalPrice}"),
                    Row(
                      children: [
                        Text("Status: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        orderDetail.isDelivered?Text("Delivered"):Text("Not Delievered")
                      ],
                    )


                  ],
                )
              ],
            ),
            _showButtons(orderDetail)
          ],
        ),
      ),
    );
  }

  _loadData() {
    BlocProvider.of<OrderBloc>(context).add(OrderInitialDataLoad(UID: widget.userDetails.UID));
  }

 Widget _showButtons(OrderDetailsTableData orderDetail) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: RaisedButton(
                onPressed: (){
                  showDialog(
                    barrierDismissible: false,
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          content: Text("Cancel Order of ${orderDetail.productName}"),
                          actions: [
                            FlatButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("No")),
                            FlatButton(
                                onPressed: (){
                                 print("Cancelled");
                                  BlocProvider.of<OrderBloc>(context).add(OrderDeleteEvent(orderDetailsTableData: orderDetail));
                                 Navigator.of(context).pop();
                                },
                                child: Text("Yes")),
                          ],
                        );
                      });
                },
                child: Text(
                  "Cancel Order"
                ),
              ),
            ),
          ),
          SizedBox(width: 5.0,),
          Expanded(
            flex: 1,
            child: Container(
              child: RaisedButton(
                onPressed: (){
                  print("Edit the order");
                },
                child: Text(
                    "Edit Order"
                ),
              ),
            ),
          ),
        ],
      ),
    );
 }
}
