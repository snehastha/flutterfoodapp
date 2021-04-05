import 'package:flutter/material.dart';

import 'customtext.dart';
class BottomNavIcon extends StatelessWidget {
  final String name;
  final String image;

  const BottomNavIcon({Key key, this.name, this.image}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset("images/$image",width: 20,height: 20,),
          SizedBox(height: 2,),
          CustomText(text: name,)
        ],
      ),
    );
  }
}
