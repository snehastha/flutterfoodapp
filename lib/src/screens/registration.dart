import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/helpers/system_navigation.dart';
import 'package:flutter_foodapp/src/screens/login.dart';

import '../widgets/customtext.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("login.png", width: 150, height: 240,)
                ]
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            icon: Icon(Icons.person)

                        ),
                      )
                  )
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            icon: Icon(Icons.person)

                        ),
                      )
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            icon: Icon(Icons.lock)

                        ),
                      )
                  )
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                          text: "Register", color: Colors.white, size: 22,)
                      ]
                  ),),
              ),
            ),

            GestureDetector(
              onTap: () {
                changeScreen(context, LoginScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: "login  here", size: 20,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}