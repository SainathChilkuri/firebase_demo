import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/Blocs/AuthBloc/auth_bloc.dart';
import 'package:firebase_demo/Blocs/PlanBloc/plan_bloc.dart';
import 'package:firebase_demo/Blocs/SignUpBloc/signup_bloc.dart';
import 'package:firebase_demo/Navigation/routes.dart';
import 'package:firebase_demo/Screens/AuthScreens/login_screen.dart';
import 'package:firebase_demo/Screens/AuthScreens/signup_screen.dart';
import 'package:firebase_demo/Screens/home_screen.dart';
import 'package:firebase_demo/Screens/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Blocs/HomeBloc/home_bloc.dart';
import 'Blocs/LoginBloc/login_bloc.dart';
import 'Blocs/OrderBloc/order_bloc.dart';
import 'DataSource/Databas/database_helper.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=> AuthBloc(),
        ),
        BlocProvider(
          create: (context)=> LoginBloc(),
        ),
        BlocProvider(
          create: (context)=> SignUpBloc(),
        ),
        BlocProvider(
          create: (context)=> HomeBloc(),
        ),
        BlocProvider(
          create: (context)=> OrderBloc(),
        ),
        BlocProvider(
          create: (context)=> PlanBloc(),
        ),
      ],

      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutingConstants.wrapperscreenRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
