import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/commons.dart';
import 'package:flutter_foodapp/src/modules/products.dart';
import 'package:flutter_foodapp/src/widgets/bestdeals_products.dart';
import 'package:flutter_foodapp/src/widgets/bottom_navigation.dart';
import 'package:flutter_foodapp/src/widgets/categories.dart';
import 'package:flutter_foodapp/src/widgets/customtext.dart';
import 'package:flutter_foodapp/src/widgets/small_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double rating=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: ListView(
          children: <Widget>[
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: "what are you looking for", size: 18),

                ),

                Stack(
                  children: [
                    IconButton(icon:Icon(Icons.notifications_none), onPressed: () {}),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(20)

                        ),
                      ),
                    ),
                  ],

                )
              ],
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow:[BoxShadow(
                    color: grey[300],
                    offset: Offset(1,1),
                    blurRadius: 4

                  )]


                ),
                child: ListTile(
                  leading: Icon(Icons.search,color: red,),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "find food and restaurants",
                      border: InputBorder.none
                    ),
                  ),
                  trailing: Icon(Icons.filter_list,color: red,),
                ),
              ),
            ),
            SizedBox(
              height:5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: "best deals",size: 20,color: grey,
              ),
            ),
            BestDeals(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: "Popular",size: 20,color: grey,
              ),
            ),
            Stack(
              children: [
                Padding(padding: EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("images/McPlant_Burger.0.PNG")) ,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      SmallButton(Icons.favorite),
                      Padding(
                          padding: const EdgeInsets.only(right:8.0),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(2.0),
                                child: Icon(Icons.star,color:Colors.yellow[980],size: 20,),
                              ),
                              Text("4.5")
                            ],
                          ),
                        ),
                      )



                  ],
                  ),
                ),
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                            gradient:LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors:[
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.05),
                                Colors.black.withOpacity(0.025),
                              ],
                            ),

                          )
                        ),)),

                Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(12,8,8,8),
                          child: RichText(text: TextSpan(children: [
                            TextSpan(text: "burger\n",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: white)),
                            TextSpan(text: "by",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: white)),
                            TextSpan(text: "Burger house",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: white)),
                          ],style: TextStyle(color: Colors.black))),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(text: TextSpan(children: [
                              TextSpan(text: "\Rs 300\n",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: white)),
                            ], style: TextStyle(color: Colors.black))),
                          ),
                        ],
                      ),
                    ))
              ],
            )

          ],
            ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomNavIcon(
              image:"home.png",
              name: "Home",
            ),
            BottomNavIcon(
              image:"target.png",
              name: "Near by",
            ),
            BottomNavIcon(
              image:"shopping.png",
              name: "Cart",
            ),
            BottomNavIcon(
              image:"account",
              name: "Account",
            ),

          ],
        ),
      ),
    );
    }
}



