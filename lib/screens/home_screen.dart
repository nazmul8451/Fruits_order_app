import 'package:e_commerce_ui/screens/home_screen.dart';
import 'package:e_commerce_ui/widgets/custom_fruits_itemCard.dart';
import 'package:e_commerce_ui/widgets/custom_item_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tabs = ["Hottest", "Popular", "New combo", "Top"];

  final List<Color> colorForCard = [
    const Color(0xFFFFFAEB),
    const Color(0xFFFEF0F0),
    const Color(0xFFF1EFF6),
  ];

  final List<String> imgPath = [
    'assets/img/fruits3.png',
    'assets/img/fruits4.png',
    'assets/img/fruits4.png',
    'assets/img/fruits3.png',

  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu,size: 30,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.favorite_border, color: Colors.orange,),
                  Text('Fav')
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
            child: Column(
            children: [
            Icon(Icons.shopping_cart_outlined, color: Colors.orange,),
            Text('My basket')
            ],
            ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Tony, What fruit salad\ncombo do you want today?',
                  style: TextStyle(fontSize: width * 0.05),
                ),
                SizedBox(height: heigth * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF3F4F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Search for fruit salad combos'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/img/filter_icon.png',
                        width: width * 0.08,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: heigth * 0.03),
                Text(
                  'Recommended Combo',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF27214D),
                  ),
                ),

                SizedBox(height: heigth * .03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(
                      width: width,
                      heigth: heigth,
                      imgPath: 'assets/img/fruits1.png',
                    ),
                    CustomCard(
                      width: width,
                      heigth: heigth,
                      imgPath: 'assets/img/fruits2.png',
                    ),
                  ],
                ),

                SizedBox(height: heigth * .03),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //tab row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(tabs.length, (index) {
                            bool isSelected = selectedIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tabs[index],
                                      style: TextStyle(
                                        fontSize: isSelected ? 20 : 16,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    //underline for selected tab
                                    if (isSelected)
                                      Container(
                                        height: 2,
                                        width: 25,
                                        color: Color(0xFFFFA451),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: heigth * .02),

                //popular item fruit card
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: heigth*0.20,
                    child: ListView.builder(
                        itemCount: imgPath.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Custom_fruit_card(
                            imgPath: imgPath[index],
                              width: width,
                              colorForCard: colorForCard[index % colorForCard.length],
                              heigth: heigth,
                          );
                        }),
                  ),
                ),
                //popular item fruit card
                SizedBox(height: heigth * .03),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

