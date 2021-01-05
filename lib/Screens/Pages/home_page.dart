import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_demo/Blocs/HomeBloc/home_bloc.dart';
import 'package:firebase_demo/Blocs/HomeBloc/home_states.dart';
import 'package:firebase_demo/DataSource/product_data.dart';
import 'package:firebase_demo/Model/Products/product_model.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Navigation/routes.dart';
import 'package:firebase_demo/Screens/Components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatefulWidget {
  UserDetails userDetails;
  HomePage({
    this.userDetails
});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UserDetails user_details = widget.userDetails;
    return BlocListener<HomeBloc,HomeStates>(
      listener: (context,state){
        if(state is HomeLogoutSuccesfulState){
          Navigator.pushReplacementNamed(context, RoutingConstants.loginscreenRoute);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.pink,
        ),
        drawer: CustomDrawer(user: user_details,),
        body: ListView(
          shrinkWrap: true,
          children: [
            //_carouselImages(),
             SingleChildScrollView(
               child: Column(
                 children: [
                   _goldCategory(),
                   _diamondCategory()
                 ],
               ),
             )

          ],
        ))

    );
  }



 Widget  _carouselImages() {
    return  Container(
      height: 300.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/carousel/img1.jpg"),
          AssetImage("images/carousel/img2.jpg"),
          AssetImage("images/carousel/img3.jpeg"),
          AssetImage("images/carousel/img4.png"),
          AssetImage("images/carousel/img5.jpg"),
          AssetImage("images/carousel/img6.jpg"),
          AssetImage("images/carousel/img7.jpg"),
          AssetImage("images/carousel/img8.jpg"),

        ],
        dotSize: 2.0,
        indicatorBgPadding: 3.0,
        overlayShadow: true,
        overlayShadowColors: Colors.white60,
        overlayShadowSize: 0.7,
        animationCurve: Curves.easeInOut,
        autoplay: true,
        dotBgColor: Colors.transparent,
        animationDuration: Duration(microseconds: 300),
      ),
    );
 }

  Widget _goldCategory() {
    return Center(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/categorypagescreen",arguments: "Gold");
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2012/12/05/100281353-gold_bars_piles_gettyP.jpg?v=1494552432"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              alignment: Alignment.center,
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }

  Widget _diamondCategory() {
    return  Center(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/categorypagescreen",arguments: "Diamond");
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.indianexpress.com/2020/10/daimond.jpg"
                  ),
                  fit: BoxFit.cover
                )
              ),
              alignment: Alignment.center,
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
