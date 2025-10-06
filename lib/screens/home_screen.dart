import 'package:e_commerce_ui/models/product_model.dart';
import 'package:e_commerce_ui/screens/add_basket_screen.dart';
import 'package:e_commerce_ui/screens/favorite_item_screen.dart';
import 'package:e_commerce_ui/screens/my_basket_screen.dart';
import 'package:e_commerce_ui/screens/search_screen.dart';
import 'package:e_commerce_ui/service_center/basket_controller.dart';
import 'package:e_commerce_ui/service_center/favorite_controller.dart';
import 'package:e_commerce_ui/widgets/custom_fruits_itemCard.dart';
import 'package:e_commerce_ui/widgets/custom_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.fruit, required this.userName});

  final String? userName;
  final FruitItem? fruit;
  static const String name = '/home-screen';

  final BasketController basketController = Get.find();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tabs = ["Hottest", "Popular", "New combo", "Top"];

  final FavoriteController controller = Get.put(FavoriteController());

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
        leading: Icon(Icons.menu, size: 30),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => Get.toNamed(FavoriteItemScreen.name),
              child: Container(
                child: Column(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.orange),
                    Text('Fav'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => Get.toNamed(MyBasket.name),
              child: Container(
                child: Column(
                  children: [
                    Icon(Icons.shopping_cart_outlined, color: Colors.orange),
                    Text('My basket'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello ${widget.userName},',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' What fruit salad\ncombo do you want today?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: heigth * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(SearchScreen.name);
                        },
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

                SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: GridView.builder(
                    itemCount: controller.items.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final fruit = controller.items[index];
                      return GestureDetector(
                        onTap: () => Get.to(AddBasketScreen(fruit: fruit)),
                        child: CustomCard(fruit: fruit),
                      );
                    },
                  ),
                ),


                SizedBox(height: 10),
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
                    height: heigth * 0.20,
                    child: ListView.builder(
                      itemCount: controller.popularItems.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Custom_fruit_card(
                          fruit: controller.popularItems[index],
                          imgPath: imgPath[index],
                          width: width,
                          colorForCard:
                              colorForCard[index % colorForCard.length],
                          heigth: heigth,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
