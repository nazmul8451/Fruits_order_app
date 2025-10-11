
import 'package:e_commerce_ui/screens/authentication_screen.dart';
import 'package:e_commerce_ui/screens/favorite_item_screen.dart';
import 'package:e_commerce_ui/screens/home_screen.dart';
import 'package:e_commerce_ui/screens/log_in_screen.dart';
import 'package:e_commerce_ui/screens/my_basket_screen.dart';
import 'package:e_commerce_ui/screens/search_screen.dart';
import 'package:e_commerce_ui/screens/sign_up_screen.dart' show SignUpScreen;
import 'package:e_commerce_ui/screens/splash_screen.dart';
import 'package:e_commerce_ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
class E_CommerceApp extends StatelessWidget {
  const E_CommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        LogInScreen.name: (context) => LogInScreen(),
        WelcomeScreen.name: (context) => WelcomeScreen(),
        AuthenticationScreen.name: (context) => AuthenticationScreen(),
        HomeScreen.name: (context) => HomeScreen(userName: ''),
        SearchScreen.name: (context) => SearchScreen(),
        MyBasket.name: (context) => MyBasket(),
        FavoriteItemScreen.name: (context) => FavoriteItemScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
      },
    );
  }
}
