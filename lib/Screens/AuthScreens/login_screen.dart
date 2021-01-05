
import 'dart:ui';

import 'package:firebase_demo/Blocs/LoginBloc/login_bloc.dart';
import 'package:firebase_demo/Blocs/LoginBloc/login_events.dart';
import 'package:firebase_demo/Blocs/LoginBloc/login_state.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Navigation/routes.dart';
import 'package:firebase_demo/Screens/home_screen.dart';
import 'package:firebase_demo/Screens/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginStates>(
      listener: (context,states){
        if(states is LoginSuccesfulState){
          return _navigatetoHome(states.user);
        }
        if(states is LoginFailedState){
          print("LoginFailed");
         return showSnackBar(context,"Incorrect Email or Password");
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            bacgroundimage(),
            loginform()

          ],
        )
      /*  Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _useremailfield(),
                _userpasswordfield(),
                _loginbutton(context),
                _signUplink(),
                BlocBuilder<LoginBloc,LoginStates>(
                    // ignore: missing_return
                    builder: (context,states){
                      if(states is InitialLoginState){
                        return Container();
                      }
                      if(states is LoginLoadingState){
                        return Center(child: CircularProgressIndicator());
                      }if(states is LoginSuccesfulState){
                        return Container();
                      }if(states is LoginFailedState){
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
            return "Incorrect Email";
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
        validator: (value){
          if(value.isEmpty){
            return "Enter Password";
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

  Widget _loginbutton(_context) {
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
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
          ),
        ),
      ),
    );
  }

  Widget _signUplink() {
    return InkWell(
      onTap: (){
          Navigator.pushReplacementNamed(context, RoutingConstants.signupscreenRoute);
      },
      child: Container(
        alignment: Alignment.center,
       margin: EdgeInsets.all(6.0),
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  void _validatecredentials() {
         BlocProvider.of<LoginBloc>(context).add(LoginPressedEvent(email: _email.text, password: _password.text));
  }

  showSnackBar(BuildContext context,String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
      print("Failed");
  }

   /*_navigatetowrapper(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WrapperScreen();
    }));
   }*/

   _navigatetoHome(UserDetails user) {
    Navigator.pushReplacementNamed(context, RoutingConstants.homescreenRoute,arguments: user);
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

  Widget loginform() {
     return ClipRRect(
       borderRadius: BorderRadius.all(Radius.circular(10.0)),
       child: BackdropFilter(
         filter: ImageFilter.blur(
             sigmaX: 5,
             sigmaY: 5
         ),
         child: Container(
           height: 400,
           margin: EdgeInsets.only(left: 9.0,right: 9.0,top: 200),
           width: double.infinity,
           color: Colors.white12,
           child:    Form(
             key: _formKey,
             child: Container(
               margin: EdgeInsets.only(left: 9.0,right: 9.0,top: 90.0),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     _useremailfield(),
                     _userpasswordfield(),
                     _loginbutton(context),
                     _signUplink(),
                     BlocBuilder<LoginBloc,LoginStates>(
                       // ignore: missing_return
                         builder: (context,states){
                           if(states is InitialLoginState){
                             return Container();
                           }
                           if(states is LoginLoadingState){
                             return Center(child: CircularProgressIndicator());
                           }if(states is LoginSuccesfulState){
                             return Container();
                           }if(states is LoginFailedState){
                             return Container();
                           }
                         })
                   ],
                 ),
               ),
             ),
           ),
         ),
       ),
     );
  }
}


