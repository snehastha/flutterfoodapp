import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/modules/products.dart';
import 'package:flutter_foodapp/src/widgets/customtext.dart';
class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
 Product product= Product(name:"pizza", price:300, rating:4.2,vendor:"good foods",wishList: true,image:"pizza.PNG" );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: null,),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Shopping Bag",),
        actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Stack(
        children:<Widget> [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset("images/shopping.png",height: 20,width: 20, color: Colors.black,),
        ),
          Positioned(
            right: 7,
            bottom: 5,
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
                  child: CustomText(text: "2",size: 16,weight:FontWeight.bold,),
                )),
          ),
          ],
    ),
      ),
    ],
    ),
    backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 120,
              width:MediaQuery.of(context).size.width -10,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.red[50],
                  offset: Offset(3,5),
                  blurRadius: 30,
                )]
              ),
              child: Row(
                children: <Widget>[
                  Image.asset("images/${product.image}",
                    height: 120,width: 120,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(text: TextSpan(children:[
                            TextSpan(text: product.name + "\n" ,style: TextStyle(color: Colors.black,fontSize: 20)),
                          TextSpan(text:"\Rs" + product.price.toString() + "\n" ,style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold)),
                        ]),),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(icon: Icon(Icons.delete), onPressed:null)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
