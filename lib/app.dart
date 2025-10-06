import 'package:e_commerce_ui/screens/add_basket_screen.dart';
import 'package:e_commerce_ui/screens/authentication_screen.dart';
import 'package:e_commerce_ui/screens/favorite_item_screen.dart';
import 'package:e_commerce_ui/screens/home_screen.dart';
import 'package:e_commerce_ui/screens/my_basket_screen.dart';
import 'package:e_commerce_ui/screens/order_complete_screen.dart';
import 'package:e_commerce_ui/screens/search_screen.dart';
import 'package:e_commerce_ui/screens/splash_screen.dart';
import 'package:e_commerce_ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
class E_CommerceApp extends StatelessWidget {
  const E_CommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      getPages: [
        GetPage(name: SplashScreen.name, page:() =>SplashScreen()),
        GetPage(name: WelcomeScreen.name, page: ()=> WelcomeScreen()),
        GetPage(name: AuthenticationScreen.name, page: ()=> AuthenticationScreen()),
        GetPage(name: FavoriteItemScreen.name, page: ()=> FavoriteItemScreen()),
        GetPage(name: MyBasket.name, page: ()=> MyBasket()),
        GetPage(name: OrderCompleteScreen.name, page: ()=> OrderCompleteScreen()),
        GetPage(name: HomeScreen.name, page: ()=> HomeScreen(userName: '')),
        GetPage(name: SearchScreen.name, page: ()=>SearchScreen()),
      ],
    );
  }
}
