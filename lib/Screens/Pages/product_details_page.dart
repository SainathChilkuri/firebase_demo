import 'package:firebase_demo/Blocs/OrderBloc/order_bloc.dart';
import 'package:firebase_demo/Blocs/OrderBloc/order_event.dart';
import 'package:firebase_demo/Blocs/OrderBloc/order_states.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:firebase_demo/Model/Products/product_model.dart';
import 'package:firebase_demo/Session/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductDetails extends StatefulWidget {
  final Product product;
  ProductDetails({
    this.product
});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var qty =[1,2,3,4,5];
  var qtyValue=1;
  final _scaffKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Product _product = widget.product;
    return BlocListener<OrderBloc,OrderState>(
      listener: (context,state){
        _scaffKey.currentState.showSnackBar(SnackBar(content: Text("Succesfully Ordered"),
          action: SnackBarAction(
            label: "Check Orders",
              onPressed: (){
              Navigator.pushReplacementNamed(context, "/ordersscreen");
              },
          ),));
      },
      child: Scaffold(
        key: _scaffKey,
        body:  ListView(
      children: [
        _dispayImage(_product.imageUrl),
        _showName(_product.title),
        Divider(color: Colors.purple,),
        _showDesc(_product.description),
        _showCategory(_product.category),
        Divider(color: Colors.purple,),
        _showPrice(_product.price),

         Row(
           children: [
             Expanded(
                 flex: 1,
                 child: Container(
                   margin: EdgeInsets.only(left: 15.0),
                     child: Text("Quantity"))),
             Expanded(
               flex: 1,
                 child: _showQuantity(),
               ),
          ]),
          _showButtons(_product,context)


      ],
      )
      ),
    );
  }
  Widget _dispayImage(String imageUrl) {
    return Container(
      height: 500,
      //margin: EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                imageUrl
            ),
            //fit: BoxFit.cover
          )
      ),
    );
  }

  Widget _showName(String title) {
    return Container(
      margin: EdgeInsets.only(left: 6.0,right: 6.0),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
    );
  }

  Widget _showDesc(String description) {
    return Container(
      margin: EdgeInsets.only(left: 15.0,right: 6.0,top: 5.0),
      alignment: Alignment.center,
      child: Text(
        description,
        style: TextStyle(
            color: Colors.black45,
        ),
      ),
    );
  }

 Widget _showCategory(String category) {
   return Container(
     margin: EdgeInsets.only(left: 15.0,right: 6.0,top: 6.0),
     alignment: Alignment.centerLeft,
     child: Text(
      "Category:  $category",
       style: TextStyle(
           color: Colors.black45,
       ),
     ),
   );
 }

  Widget _showPrice(int price) {
    return Container(
      margin: EdgeInsets.only(left: 15.0,right: 6.0,top: 10.0),
      alignment: Alignment.center,
      child: Text(
        "Price: $price /-",
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 15.0
        ),
      ),
    );
  }

  Widget _showButtons(Product product,BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: InkWell(
                onTap: (){
                  print("Added to cart");
                },
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.pink,
                              Colors.purple
                            ]
                        )
                    ),
                  ),
                ),
              )),
          SizedBox(width: 6.0,),
          Expanded(
            flex: 1,
              child: InkWell(
                onTap: (){
                  print("Ordered");
                  _showDialog(product);
                },
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.pink,
                          Colors.purple
                        ]
                      )
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

 Widget _showQuantity() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: DropdownButton<int>(
        value: qtyValue,
        dropdownColor: Colors.purple,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        iconEnabledColor: Colors.purple,
        iconDisabledColor: Colors.black38,
        onChanged: (int value){
          setState(() {
            qtyValue = value;
          });
        },
        items: qty.map((int value) {
          return DropdownMenuItem<int>(
              value: value,
              child: Container(
                  width: 100.0,
                  child: Text("$value")),);
        }).toList()
      ),
    );
 }

  void _showDialog(Product product) {
      showDialog(
        barrierDismissible: false,
          context: context,
      builder: (context){
            return AlertDialog(
              content: Container(
                height: 100.0,
                child: Column(
                  children: [
                    Text(product.title),
                    Text("Price ${product.price}"),
                    Text("Quantity ${qtyValue}"),
                    Text("Total Price: ${product.price * qtyValue}"),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:Text("Wait")),
                FlatButton(
                    onPressed: (){
                      UserSession.getSession().then((value) {
                        var orderDetails = OrderDetailsTableData(
                            quantity: qtyValue,
                            totalPrice: qtyValue*product.price,
                            custId: value.UID,
                            productName: product.title,
                            productCategory: product.category,
                            productDesc: product.description,
                            isDelivered: false,
                            price: product.price,
                            category: product.category,
                            imageURL: product.imageUrl);

                        BlocProvider.of<OrderBloc>(context).add(OrderInsertEvent(
                            orderDetail: orderDetails
                        ));
                        Navigator.pop(context);
                      });
                    },
                    child:Text("Order"))
              ],


            );
      });
  }
}
