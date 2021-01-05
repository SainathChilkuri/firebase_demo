import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/Model/user_model.dart';

class UserCollections{
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<dynamic> insertUserDetails(UserDetails user,String uid)async{
    _firestore.collection("users").doc(uid).set(
      user.toMap()
    ).then((_){
      print("Succesfully inserted--------------");
      });
    }
   static Future<dynamic> getuserDetails(String uid) async{
    UserDetails user;
   var result =  await _firestore.collection("users").doc(uid)
        .get();
    user = UserDetails().fromMap(result.data());
    return user;
     /*.then((value) {
          print("--------------------");
          print(value.data()['lastname']);
            print(UserDetails().fromMap(value.data()));
            user = UserDetails().fromMap(value.data());
          print("--------------------");
          print(user.lastname);
          print(user.email +user.lastname +user.lastname);
          //return user;
    });*/

   }
}