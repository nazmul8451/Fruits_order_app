import 'package:e_commerce_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddBasketScreen extends StatelessWidget {
  const AddBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFA451),
        appBar: MyAppBart(),
        body: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              width: double.infinity,
              child: Container(
                height: screenHeight * 0.100,
                width: screenWidth * 0.200,
                child: Image.asset('assets/img/fruits4.png'),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: screenHeight * 07,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quinoa Fruit Salad',
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.025,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //item increase and decrease button
                                      SizedBox(
                                        width: screenWidth * 0.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.remove_circle_outline,
                                              size: 25,
                                              color: Color(0xFF333333),
                                            ),
                                          
                                            Text(
                                              '0',
                                              style: TextStyle(fontSize: 23),
                                            ),
                                          
                                            Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFF2E7),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    6,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/img/add_icon.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Price item
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/img/money_icon_for_card.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '2000',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFF08626),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1, color: Color(0xFFF3F3F3)),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicWidth(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'One Pack Contains:',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                          
                                  Wrap(
                                    children: [
                                      Text(
                                        'Red Quinoa, ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Lime, ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Honey, ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Strawberries, ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Mango, ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Fresh mint, ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                          
                                  Divider(height: 1, color: Color(0xFFF3F3F3)),
                                  SizedBox(height: screenHeight * 0.015),
                                  Text(
                                    'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                     Spacer(),
                      Expanded(
                        child: Padding(padding: EdgeInsets.all(20),
                          child:Row(
                         children: [
                           Container(
                             width: 60,
                             height: 60,
                             decoration: BoxDecoration(
                               color: Color(0xFFFFF7F0),
                               borderRadius: BorderRadius.circular(
                                 100,
                               ),
                             ),
                             child: Icon(
                               Icons.favorite_border_outlined,
                               size: 30,
                               color: Color(0xFFFFA451),
                             ),
                           ),
                           // Favorite item conteianer
                           Expanded(
                             child: Container(
                               margin: EdgeInsets.only(left: 30),
                               height: 60,
                               decoration: BoxDecoration(
                                 color: Color(0xFFFFA451),
                                 borderRadius:
                                 BorderRadius.circular(12),
                               ),
                               child: Center(
                                 child: Text(
                                   'Add to basket',
                                   style: TextStyle(
                                     fontSize: 16,
                                     color: Colors.white,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                                             ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
