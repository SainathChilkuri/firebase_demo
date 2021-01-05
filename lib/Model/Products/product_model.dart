import 'package:firebase_demo/DataSource/product_data.dart';

class Product{
  String id;
  int price;
  String title;
  String description;
  String category;
  String imageUrl;
  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.imageUrl
   });

  factory Product.fromMap(Map<String,dynamic> data){
    return Product(
       id: data['id'],
       price: data['price'],
       title:data['title'],
       category: data['category'],
       description:data['description'],
       imageUrl: data['image']
    );
  }
}