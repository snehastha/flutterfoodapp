import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/helpers/user.dart';
import 'package:flutter_foodapp/src/modules/user.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';


enum Status{
  Uninitialized,Unauthenticated,Authenticating,Authenticated
}
class AuthProvider with ChangeNotifier {

  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters
  UserModel get userModel => _userModel;
  Status get status => _status;
  User get user => _user;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();


  AuthProvider.initialize() : _auth=FirebaseAuth.instance{

    _auth.authStateChanges().listen(_onStateChanged);

  }
  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }


  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim()).then((result) {
        _firestore.collection('users').doc(result.user.uid).set({
          'name': name.text,
          'email': email.text,
          'id':result.user.uid,
        });
      });
    return true;
  }
    catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;

    }
}
  Future signOut() async{
    _auth.signOut();
    _status=Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
  void cleanControllers(){
    email.text="";
    password.text="";
    name.text="";
  }


   Future<void> _onStateChanged(User user)async{
    if(user==null){
      _status=Status.Uninitialized;

    }else{
      _user=user;
      _status=Status.Authenticated;
      _userModel=await _userServices.getUserById(user.uid);

    }
    notifyListeners();

  }

  }


