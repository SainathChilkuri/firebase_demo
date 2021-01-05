
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Screens/Pages/aboutus_page.dart';
import 'package:firebase_demo/Screens/Pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
class HomeScreen extends StatefulWidget {
  final UserDetails user;
  HomeScreen({
    this.user
});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex;
 PageController _controller;
  //final _scaffkey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
   _controller = PageController();
    // TODO: implement initState
    super.initState();
    _selectedIndex =0;
  }
  @override
  Widget build(BuildContext context) {
    UserDetails user = widget.user;
    return Scaffold(
        //drawer: CustomDrawer(user: user),
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,color: Colors.black26,),
            title: Text("Home"),
            activeIcon: Icon(Icons.home_outlined,color: Colors.purpleAccent,)),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline,color: Colors.black26,),
                title: Text("About us"),
                activeIcon: Icon(Icons.info_outline,color: Colors.purpleAccent,)),
            BottomNavigationBarItem(
                icon: Icon(Icons.call,color: Colors.black26,),
                title: Text("Contact"),
                activeIcon: Icon(Icons.call,color: Colors.purpleAccent,))
          ],
        ),
        body: PageView(
          controller: _controller,
          onPageChanged: _pageChanged,
          physics:  NeverScrollableScrollPhysics(),
          children: [
            HomePage(userDetails: user),
            AboutUs(),
            ContactUs()
          ],
      )
      );
  }

  void _onTapped(int value) {
    _controller.jumpToPage(value);
  }

  void _pageChanged(int value) {
    setState(() {
      _selectedIndex= value;
    });

  }
}
