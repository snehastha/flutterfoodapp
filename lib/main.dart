import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/providers/auth.dart';
import 'package:flutter_foodapp/src/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_foodapp/src/screens/login.dart';
import 'package:flutter_foodapp/src/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize())

  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Food App',
    theme: ThemeData(

      primarySwatch: Colors.red,
    ),
    home:ScreensController()
  ) ));
}
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:return LoginScreen();
    }
  }
}


