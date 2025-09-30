import 'package:flutter/material.dart';
class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  CustomElevatedButton({
    super.key,
    required this.screenHeigth,
    required this.screenWidth,
    required this.onPressed,
    required this.buttonText,
  });

  final double screenHeigth;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenHeigth * 0.07,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(0xFFFFA451),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "$buttonText",
            style: TextStyle(
              fontSize: screenHeigth * 0.02,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
