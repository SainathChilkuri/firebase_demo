import 'package:firebase_demo/Blocs/HomeBloc/home_bloc.dart';
import 'package:firebase_demo/Blocs/HomeBloc/home_events.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Navigation/routes.dart';
import 'package:firebase_demo/Session/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomDrawer extends StatefulWidget {
  final user;
  CustomDrawer({
    @required this.user
  });
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    UserDetails user = widget.user;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pinkAccent,
                  Colors.purpleAccent
                ]
              )
            ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.tealAccent,
                  radius: 15.0,
                 child: Text(user.firstname[0].toUpperCase(),
                 style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold
                 ),),
                ),
              ),
              accountName: Text(user.firstname.toUpperCase() + " " + user.lastname.toUpperCase()),
              accountEmail: Text(user.email)),
          InkWell(
            onTap: (){
              print("Home");
              Navigator.pushReplacementNamed(context, RoutingConstants.homescreenRoute, arguments: user);
            },
            splashColor: Colors.red,
            child: _mytile("Home",Icon(Icons.home_outlined,color: Colors.purpleAccent,)),),
          InkWell(
              onTap: (){
                print("Orders");
                Navigator.pushNamed(context, "/ordersscreen", arguments: user);
              },
              splashColor: Colors.red,
              child: _mytile("My Orders",Icon(Icons.add_shopping_cart,color: Colors.purpleAccent,))),
          InkWell(
              onTap: (){
                print("Home");
              },
              splashColor: Colors.red,
              child: _mytile("Wallet",Icon(Icons.wallet_giftcard,color: Colors.purpleAccent,))),
          InkWell(
              onTap: (){
                print("10 + 1 Plans");
                Navigator.pushNamed(context, "/planscreen");
              },
              splashColor: Colors.red,
              child: _mytile("10 + 1 plan",Icon(Icons.local_offer_outlined,color: Colors.purpleAccent,))),
          InkWell(
              onTap: (){
                print("Home");
              },
              splashColor: Colors.red,
              child: _mytile("FAQ",Icon(Icons.help,color: Colors.purpleAccent,))),
          InkWell(
              onTap: (){
                print("GoldMine");
                Navigator.pushNamed(context, "/goldminescreen");
              },
              splashColor: Colors.red,
              child: _mytile("My Goldmine",Icon(Icons.credit_card_outlined,color: Colors.purpleAccent,))),
          Divider(),
          InkWell(
              onTap: (){
                print("Home");
                showDialog(
                  barrierDismissible: false,
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        backgroundColor: Colors.pinkAccent,
                        elevation: 15.0,
                        content: Text("Sure to Logout?"),
                        actions: [
                          FlatButton(
                              onPressed: (){
                                BlocProvider.of<HomeBloc>(context).add(HomeLogoutPressed());
                                UserSession.clearSession();
                                Navigator.pop(context);
                              },
                              child:Text("Yes",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),)),
                          FlatButton(
                              onPressed: (){
                                //BlocProvider.of<HomeBloc>(context).add(HomeLogoutPressed());
                                Navigator.pop(context);
                              },
                              child:Text("No",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),))
                        ],
                      );
                    });

              },
              splashColor: Colors.red,
              child: _mytile("Logout",Icon(Icons.power_settings_new,color: Colors.purpleAccent,)))
        ],
      ),
    );
  }

  Widget _mytile(String s, Icon icon) {
    return ListTile(
        leading: icon,
        title: Text(s),
      );
  }
}
