import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/providers/app.dart';
import 'package:flutter_foodapp/src/providers/category.dart';
import 'package:flutter_foodapp/src/providers/product.dart';
import 'package:flutter_foodapp/src/providers/restaurant.dart';
import 'package:flutter_foodapp/src/providers/user.dart';
import 'package:flutter_foodapp/src/screens/home.dart';
import 'package:flutter_foodapp/src/screens/login.dart';
import 'package:flutter_foodapp/src/widgets/loading.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value:AppProvider()),

        ChangeNotifierProvider.value(value: Userprovider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController())));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Userprovider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}