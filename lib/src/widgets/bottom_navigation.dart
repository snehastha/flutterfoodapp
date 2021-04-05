import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customtext.dart';
class BottomNavIcon extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  const BottomNavIcon({Key key, this.name, this.image, this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: [
            Image.asset("images/$image",width: 20,height: 20,),
            SizedBox(height: 2,),
            CustomText(text: name,)
          ],
        ),
      ),
    );
  }
}
