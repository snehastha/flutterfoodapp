import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/helpers/system_navigation.dart';
import 'package:flutter_foodapp/src/providers/user.dart';
import 'package:flutter_foodapp/src/screens/login.dart';
import 'package:flutter_foodapp/src/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../widgets/customtext.dart';
import 'home.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<Userprovider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: authProvider.status==Status.Authenticating? Loading() :SingleChildScrollView(
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
                        controller: authProvider.name,
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
                        controller: authProvider.email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
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
                        obscureText: true,
                        controller: authProvider.password,
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
              child: GestureDetector(
                onTap: () async{
                  print("btn clicked");
                  if(! await authProvider.signUp()){
                    _key.currentState.showSnackBar
                      (SnackBar(content: Text("Registration failed"))
                    );
                    return;
                  }
                  authProvider.clearController();
                  changeScreenReplacement(context, LoginScreen());
                },
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