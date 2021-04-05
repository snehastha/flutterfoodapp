import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/modules/category.dart';

import '../helpers/style.dart';
import 'customtext.dart';

List<Category> categorieslist=[
  Category(name: "chinesefood", image:("chinese_food.PNG")),
  Category(name: "indian", image:("indian.PNG")),
  Category(name: "italian", image:("italian-food-1024.PNG")),
  Category(name: "seafood", image:("seafood.PNG")),
];
class Categories extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorieslist.length,
        itemBuilder: (_,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [BoxShadow(
                            color: red[50],
                            offset: Offset(4, 6),
                            blurRadius: 20

                        )
                        ]
                    ),

                    child: Padding(padding: EdgeInsets.all(4),
                      child: Image.asset("images/${categorieslist[index].image}", width: 50,),)

                  ),
                  SizedBox(height: 3,),
                  CustomText(text:categorieslist[index].name, color: black,)
                ],
            ),
          );
        },
      ),

    );
  }
}
