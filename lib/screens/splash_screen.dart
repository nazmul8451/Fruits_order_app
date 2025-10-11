import 'package:e_commerce_ui/screens/log_in_screen.dart';
import 'package:e_commerce_ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String name = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LogInScreen.name);
    });
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/img/splash_img.png',
          height: screenHeight * 0.50,
          width: screenWidth * 0.8,
        ),
      ),
    );
  }
}
