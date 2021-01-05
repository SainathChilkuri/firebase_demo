import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Session/user_session.dart';
import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget {
  /*final UserDetails userDetails;
  AboutUs({
    this.userDetails
});*/
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  UserDetails _userDetails = UserDetails(UID: "",firstname: "",lastname: "",email: "");
  Future<UserDetails> userDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        _getSessionDetails();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hello"
        ),
      ),
      body: Center(
        child: Text(
          _userDetails.UID
        ),
      ),
    );
  }

  void _getSessionDetails() async {
    userDetails =  UserSession.getSession();
    userDetails.then((value) {
      setState(() {
        _userDetails = value;
      });
      //print(value.lastname);
    });

  }
}


