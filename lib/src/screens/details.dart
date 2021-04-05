import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/helpers/style.dart';
import 'file:///E:/flutter%20projects/flutter_foodapp/lib/src/helpers/style.dart';
import 'package:flutter_foodapp/src/modules/products.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_foodapp/src/widgets/customtext.dart';
import 'package:flutter_foodapp/src/widgets/small_button.dart';
import '../helpers/style.dart';
class Details extends StatefulWidget {
  final Product product;

  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
                child: Stack(
                  children:<Widget> [

                    Carousel(
                      images: [
                        AssetImage('images/${widget.product.image}'),
                        AssetImage('images/${widget.product.image}'),
                        AssetImage('images/${widget.product.image}'),
                      ],
                      dotBgColor:Colors.white,
                      dotColor: Colors.grey,
                      dotIncreasedColor: Colors.blue,
                      dotIncreaseSize: 1.5,
                      autoplay: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                          onPressed: () {  Navigator.pop(context);},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Image.asset("images/shopping.png",height: 30,width: 30, color: Colors.white,
                                    ),
                                    Positioned(
                                      right: 5,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow:[
                                            BoxShadow(
                                                color: Colors.grey,
                                              offset: Offset(2,1),
                                              blurRadius: 3
                                            )
                                            ]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 4,right: 4),
                                            child: CustomText(text: "2",size: 14,weight:FontWeight.bold,),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 20,
                        bottom: 55,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:[BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(2,1),
                              blurRadius: 3
                            )]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                                Icons.favorite,
                              size: 22,
                                color: Colors.red,
                            )),
                          ),
                        )
                  ],
                ),
            ),
            CustomText(text: widget.product.name,size: 26,weight: FontWeight.bold,),
            CustomText(text: "\Rs" + widget.product.price.toString(),size: 18, color: Colors.red,weight: FontWeight.w400),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove,size: 36,), onPressed: (){}),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28,12,28,12),
                      child: CustomText(text: "Add to Basket",size: 24,color: Colors.white,weight: FontWeight.w600,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add,size: 36,color:Colors.red,), onPressed: (){}),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}
