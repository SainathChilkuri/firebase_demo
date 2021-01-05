import 'package:firebase_demo/DataSource/product_data.dart';
import 'package:firebase_demo/Model/Products/product_model.dart';
import 'package:flutter/material.dart';
class CategoryPage extends StatefulWidget {
  final category;
  CategoryPage({
    this.category
  });
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var product;
  @override
  Widget build(BuildContext context){
    if(widget.category == "Gold"){
      print(widget.category);
      setState(() {
        product = ProductData.productData;
      });

    }else if(widget.category == "Diamond"){
      print(widget.category);
      setState(() {
        product = ProductData.diamondData;
      });

    }
    return Scaffold(
      body:   Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: product.length,
                // ignore: missing_return
                itemBuilder: (context,index){
                  var productDetails = Product.fromMap(product[index]);
                  return _displayCard(productDetails);
                }),
          ),
    );
  }
  Widget _displayCard(Product product) {

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,"/productsdetailscreen",arguments: product);
      },
      child: Container(
        margin: EdgeInsets.all(6.0),
        child: Card(
            elevation: 15.0,
            child: GridTile(
              footer: Container(
                height: 40.0,
                alignment: Alignment.bottomCenter,
                color: Colors.black12,
                child: ListTile(
                  //title: Text(product.title),
                  subtitle: Center(child: Text("Rs. ${product.price} /-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          product.imageUrl
                      ),
                      //fit: BoxFit.cover
                    )
                ),
              ),
            )

        ) ,
      ),
    );
  }
}
