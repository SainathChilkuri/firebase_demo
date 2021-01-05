import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Repository/user_collections.dart';

class UserRepository{
   FirebaseAuth _firebaseAuth;
  UserRepository(){
    _firebaseAuth = FirebaseAuth.instance;
  }
  Future<UserCredential> signInWithCredentials(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return result;
  }
  Future<UserCredential> createUserWithEmailandPassword(String email,String password,UserDetails userDetails)async{
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    userDetails.UID = result.user.uid;
    print("--------------------------");
    print(userDetails.UID);
    UserCollections.insertUserDetails(userDetails, result.user.uid);
    _firebaseAuth.signOut();
    return result;
  }
  Future signout()async{
    await _firebaseAuth.signOut();
  }
  Future<User> getUser()async{
    print("${_firebaseAuth.currentUser.email}");
    return _firebaseAuth.currentUser;
  }
  Future<bool> isSignedIn() async {
    var user = await _firebaseAuth.currentUser;
    return user!=null;
  }
}