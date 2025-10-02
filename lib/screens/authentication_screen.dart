import 'package:e_commerce_ui/screens/home_screen.dart';
import 'package:e_commerce_ui/widgets/custom_elaveted_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  static const String name = '/auth-screen';

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
                          'assets/img/auth_img_container.png',
                          width: screenWidth * 0.836,
                          height: screenHeigth * 0.325,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeigth * 0.01),

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
                          'What is your Firstname?',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Color(0xFF27214D),
                          ),
                        ),
                        SizedBox(height: screenHeigth * 0.03),
                        Container(
                          height: screenHeigth * 0.07,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F1F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              cursorColor: Color(0xFFC2BDBD),
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Color(0xFFC2BDBD)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeigth * 0.05),
                        CustomElevatedButton(
                          screenHeigth: screenHeigth,
                          screenWidth: screenWidth,
                          onPressed: () => Get.toNamed(HomeScreen.name),
                          buttonText: "Start Ordering",
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
