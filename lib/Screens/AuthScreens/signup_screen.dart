import 'dart:ui';

import 'package:firebase_demo/Blocs/SignUpBloc/signup_bloc.dart';
import 'package:firebase_demo/Blocs/SignUpBloc/signup_events.dart';
import 'package:firebase_demo/Blocs/SignUpBloc/signup_states.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc,SignUpStates>(
      listener: (context,states){
        if(states is SignUpSuccessful){
          return _navigatetoLoginScreen(context);
        }
        if(states is SignUpFailed){
          return _showSnackBar("Failed");
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            bacgroundimage(),
            signupform()
          ],
        )
        /* Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _useremailfield(),
              _userpasswordfield(),
              _signupbutton(context),
              _loginlink(),
              // ignore: missing_return
              BlocBuilder<SignUpBloc,SignUpStates>(builder: (context,state){
                if(state is SignUpInitial){
                  return Container();
                }
                if(state is SignUpLoadingState){
                  return Container(
                    margin: EdgeInsets.all(9.0),
                      child: LinearProgressIndicator());
                }
                if(state is SignUpSuccessful){
                  return Container();
                }
                if(state is SignUpFailed){
                  return Container();
                }
              })
            ],
          ),
        ),*/
      ),
    );
  }

  Widget _useremailfield() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _email,
        // ignore: missing_return
        validator: (value){
          if(value.isEmpty){
            return "Enter Email";
          }
          if(value.isNotEmpty && !value.contains("@gmail.com")){
            return "Enter valid Email";
          }
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold
            ),
            labelText: "Email",
            prefixIcon: Icon(Icons.email_outlined,color: Colors.purple,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0)
            )
        ),
      ),
    );
  }

  Widget _userpasswordfield() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        controller: _password,
        // ignore: missing_return
        validator: (value){
          if(value.isEmpty){
            return "Enter Password";
          }
          if(value.length < 8){
            return "Enter min 8 characters";
          }
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold
            ),
            labelText: "Password",
            prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.purple,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0)
            )
        ),
      ),
    );
  }

  Widget _signupbutton(_context) {
    return InkWell(
      onTap: (){
        if(_formKey.currentState.validate()){
           _validatecredentials();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.pinkAccent,
                  Colors.purpleAccent
                ]
            )
        ),
        child: Text(
            "Sign up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0
              ),
        ),
      ),
    );
  }

  Widget _loginlink() {
    return InkWell(
      onTap: (){
        Navigator.pushReplacementNamed(context, RoutingConstants.loginscreenRoute);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(6.0),
        child: Text(
          "login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _validatecredentials() {
       var user  =UserDetails(firstname: _firstname.text,lastname: _lastname.text,email: _email.text);
      BlocProvider.of<SignUpBloc>(context).add(SignUpButtonPressed(email: _email.text, password: _password.text,user: user));
      _formKey.currentState.reset();

  }

 _navigatetoLoginScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutingConstants.loginscreenRoute);
 }

   _showSnackBar(String s) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(s)));
   }
  Widget bacgroundimage() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bk1.jpg",),
              fit: BoxFit.cover
          )
      ),

    );
  }

  Widget signupform() {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: BackdropFilter(
        filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5
    ),
    child: Container(
    height: 450,
    margin: EdgeInsets.only(left: 9.0,right: 9.0,top: 200),
    width: double.infinity,
    color: Colors.white12,
    child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.only(left: 9.0,right: 9.0,top: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: _firstnamefield()),
                      Expanded(
                        flex: 1,
                          child: _lastnamefield()),
                    ],
                  ),
                  _useremailfield(),
                  _userpasswordfield(),
                  _userConfirmpasswordfield(),
                  _signupbutton(context),
                  _loginlink(),
                  // ignore: missing_return
                  BlocBuilder<SignUpBloc,SignUpStates>(builder: (context,state){
                    if(state is SignUpInitial){
                      return Container();
                    }
                    if(state is SignUpLoadingState){
                      return Container(
                        margin: EdgeInsets.all(9.0),
                          child: LinearProgressIndicator());
                    }
                    if(state is SignUpSuccessful){
                      return Container();
                    }
                    if(state is SignUpFailed){
                      return Container();
                    }
                  })
                ],
              ),
            ),
          ),
        ))));
  }

  Widget _userConfirmpasswordfield() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        controller: _confirmpassword,
        // ignore: missing_return
        validator: (value){
          if(value != _password.text){
            return "Password Not Matched";
          }
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold
            ),
            labelText: "Confirm Password",
            prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.purple,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0)
            )
        ),
      ),
    );
  }

 Widget  _firstnamefield() {
   return Container(
     margin: EdgeInsets.all(9.0),
     child: TextFormField(
       controller: _firstname,
       // ignore: missing_return
       validator: (value){
         if(value.isEmpty){
           return "Required";
         }
       },
       decoration: InputDecoration(
           labelStyle: TextStyle(
               color: Colors.pink,
               fontWeight: FontWeight.bold
           ),
           labelText: "Firstname",
           prefixIcon: Icon(Icons.account_circle,color: Colors.purple,),
           border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(6.0)
           )
       ),
     ),
   );
 }

 Widget _lastnamefield() {
   return Container(
     margin: EdgeInsets.all(9.0),
     child: TextFormField(
       controller: _lastname,
       // ignore: missing_return
       validator: (value){
         if(value.isEmpty){
           return "Required";
         }
       },
       decoration: InputDecoration(
           labelStyle: TextStyle(
               color: Colors.pink,
               fontWeight: FontWeight.bold
           ),
           labelText: "Lastname",
           prefixIcon: Icon(Icons.account_circle,color: Colors.purple,),
           border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(6.0)
           )
       ),
     ),
   );
 }
}

