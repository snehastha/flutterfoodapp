import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/helpers/system_navigation.dart';
import 'package:flutter_foodapp/src/screens/registration.dart';


import '../widgets/customtext.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  Image.asset("images/login.png", width: 150, height: 240,)
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
                            hintText: "Emails",
                            icon: Icon(Icons.email)

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
                          text: "Login", color: Colors.white, size: 22,)
                      ]
                  ),),
              ),
            ),

            GestureDetector(
              onTap: () {
                changeScreen(context, RegistrationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Register here", size: 20,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



