import 'package:e_commerce_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  static const String name = '/order-complete-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //iamge
          Center(
            child: Image.asset(
              'assets/img/congress_image.png',
              height: 160,
              width: 200,
            ),
          ),
          SizedBox(height: 40,),
          //Congratulations!!!
          Text(
            'Congratulations!!!',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 20,),
          //Your order have been taken and is being attended to
          Text(
            textAlign:TextAlign.center ,
            'Your order have been taken and\nis being attended to',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30,),
          //Track order button
          Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xFFFFA451),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Track order',style: TextStyle(color: Colors.white,),),),
          ),
          SizedBox(height: 30,),
          //contitnue shopping button
          GestureDetector(
            onTap: (){
              Get.toNamed(HomeScreen.name);

            },
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Contitnue shopping',style: TextStyle(color: Color(0xFFFFA451),),),),
            ),
          ),
        ],
      ),
    );
  }
}
