import 'package:firebase_demo/Blocs/AuthBloc/auth_bloc.dart';
import 'package:firebase_demo/Blocs/AuthBloc/auth_event.dart';
import 'package:firebase_demo/Blocs/AuthBloc/auth_state.dart';
import 'package:firebase_demo/Screens/AuthScreens/login_screen.dart';
import 'package:firebase_demo/Screens/AuthScreens/signup_screen.dart';
import 'package:firebase_demo/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';
class WrapperScreen extends StatefulWidget {
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthBloc,AuthState>(
      listener: (context,states){
        if(states is AuthInitial){
          print("state: Auth Initial");
          BlocProvider.of<AuthBloc>(context).add(AppStarted());
        }
      },
        // ignore: missing_return
        builder: (context,states){
          if(states is AuthInitial){
            print("Building AuthInitial");
            BlocProvider.of<AuthBloc>(context).add(AppStarted());
            return SplashScreen();
          }
          if(states is AuthSuccesful){
            return HomeScreen(user: states.user);
          }
          if(states is UnAuthState){
            return SignUpScreen();
          }
        });
  }
}
