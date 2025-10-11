import 'package:e_commerce_ui/models/product_model.dart';
import 'package:e_commerce_ui/screens/authentication_screen.dart';
import 'package:e_commerce_ui/screens/welcome_screen.dart';
import 'package:e_commerce_ui/widgets/custom_elaveted_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key,});


  static const String name = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeigth,
          child: Column(
            children: [
              // Top container - 60%
              SizedBox(
                height: screenHeigth * 0.6,
                child: Container(
                  color: Color(0xFFFFA451),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/img/fruit_drops.png',
                              height: screenHeigth * 0.08,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Image.asset(
                          'assets/img/welcome_img_container.png',
                          width: screenWidth * 0.836,
                          height: screenHeigth * 0.325,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeigth*0.01),

                        Image.asset(
                          'assets/img/welcome_shadow.png',
                          width: screenWidth * 0.8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom container - 40% scrollable if content overflow
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get The Freshest Fruit Salad Combo',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF27214D),
                          ),
                        ),
                        SizedBox(height: screenHeigth * 0.03),
                        Text(
                          'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: screenHeigth * 0.05),

                        CustomElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, AuthenticationScreen.name);
                          },
                          screenHeigth: screenHeigth,
                          screenWidth: screenWidth, buttonText: "Let’s Continue",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
