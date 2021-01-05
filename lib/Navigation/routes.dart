import 'package:firebase_demo/Model/Products/product_model.dart';
import 'package:firebase_demo/Screens/10+1_plans.dart';
import 'package:firebase_demo/Screens/AuthScreens/login_screen.dart';
import 'package:firebase_demo/Screens/AuthScreens/signup_screen.dart';
import 'package:firebase_demo/Screens/Pages/category_page.dart';
import 'package:firebase_demo/Screens/Pages/home_page.dart';
import 'package:firebase_demo/Screens/Pages/product_details_page.dart';
import 'package:firebase_demo/Screens/goldmine_screen.dart';
import 'package:firebase_demo/Screens/home_screen.dart';
import 'package:firebase_demo/Screens/order_screen.dart';
import 'package:firebase_demo/Screens/wrapper_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    var data = settings.arguments;
       switch(settings.name){
         case RoutingConstants.homescreenRoute:
              return MaterialPageRoute(builder: (_)=> HomeScreen(user: data));
         case RoutingConstants.loginscreenRoute:
           return MaterialPageRoute(builder: (_)=> LoginScreen());
         case RoutingConstants.signupscreenRoute:
           return MaterialPageRoute(builder: (_)=> SignUpScreen());
         case RoutingConstants.wrapperscreenRoute:
           return MaterialPageRoute(builder: (_)=> WrapperScreen());
         case RoutingConstants.productDetailPageRoute:
           Product product = settings.arguments;
           return MaterialPageRoute(builder: (_)=> ProductDetails(product: data));
         case RoutingConstants.categoryPageRoute:
           return MaterialPageRoute(builder: (_)=> CategoryPage(category: data));
         case RoutingConstants.orderscreenRoute:
           return MaterialPageRoute(builder: (_)=> OrderScreen(userDetails: data,));
         case RoutingConstants.planRoute:
           return MaterialPageRoute(builder: (_)=> PlanScreen());
         case RoutingConstants.goldmineRoute:
           return MaterialPageRoute(builder: (_)=> GoldMineScreen());
       }
  }
}
class RoutingConstants{
  static const String loginscreenRoute = "/login";
  static const String signupscreenRoute = "/signup";
  static const String homescreenRoute = "/homescreen";
  static const String wrapperscreenRoute = "/wrapperscreen";
  static const String productDetailPageRoute = "/productsdetailscreen";
  static const String categoryPageRoute = "/categorypagescreen";
  static const String orderscreenRoute = "/ordersscreen";
  static const String planRoute = "/planscreen";
  static const String goldmineRoute = "/goldminescreen";
}
