import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/helpers/system_navigation.dart';
import 'package:flutter_foodapp/src/modules/products.dart';
import 'package:flutter_foodapp/src/screens/details.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helpers/style.dart';
import 'customtext.dart';
List<Product>productsList=[
  Product(name:"pizza", price:300, rating:4.2,vendor:"good foods",wishList: true,image:"pizza.PNG" ),
  Product(name:"biryani", price:500, rating:4.5,vendor:"good foods",wishList: false,image:"biryani.PNG" ),
  Product(name:"momos", price:200, rating:4.5,vendor:"good foods",wishList: true,image:"momos.PNG" ),
];
class BestDeals extends StatelessWidget {
  double rating=0.0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_,index){
            return Padding(padding: EdgeInsets.fromLTRB(12,14,16,12),
              child:GestureDetector(
                onTap: (){
                  changeScreen(_,Details(product: productsList[index],));
                },
                child: Container(
                  height: 240,
                  width: 220,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: grey,
                            offset:Offset(15,5),
                            blurRadius: 30
                        )
                      ]
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/${productsList[index].image}",
                        height: 140,width: 140,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(text: productsList[index].name,),
                          ),

                          Padding(padding: EdgeInsets.all(8),
                            child:Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey,
                                        offset:Offset(4,1),
                                        blurRadius: 4
                                    )
                                  ]
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child:productsList[index].wishList?
                                Icon(Icons.favorite,
                                  size: 18,color: red,):
                                Icon(Icons.favorite_border,
                                  size: 18,color: red,),
                              ),
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [

                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: CustomText(text:productsList[index].rating.toString()
                                  ,color: grey,),
                              ),
                              SizedBox(width: 1,),
                              SmoothStarRating(
                                starCount: 5,
                                isReadOnly: false,
                                size: 16,
                                color: red,
                                rating: rating,
                                onRated: (value){
                                  setState(() {
                                    rating=value;
                                    print("Rating is :$rating");

                                  });
                                },

                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: CustomText(text: "\Rs${productsList[index].price}",weight:FontWeight.bold,),

                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),);
          }),
    );
  }

  void setState(Null Function() param0) {}

}
