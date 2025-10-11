import 'package:e_commerce_ui/models/product_model.dart' as model;
import 'package:e_commerce_ui/service_center/basket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../service_center/favorite_controller.dart';

class CustomCard extends StatelessWidget {
  final model.FruitItem fruit;
  CustomCard({super.key, required this.fruit});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Consumer<FavoriteItemController>(
                builder: (context,controller,child) {
                return  IconButton(
                    onPressed: () {
                      controller.toggleFavorite(fruit);
                    },
                    icon: Icon(
                      fruit.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.orange,
                    ),
                  );
                }
              ),

            ),
            Image.asset(fruit.imgPath, height: height * 0.11),
            SizedBox(height: 5),
            Text(
              fruit.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/money_icon_for_card.png',
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    fruit.price,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFF08626),
                    ),
                  ),
                  Spacer(),
                  Consumer<BasketController>(
                    builder:(context,controller,child) {
                      return GestureDetector(
                        onTap: () {
                          controller.addToBasket(fruit);
                          Get.snackbar(
                            'Added!',
                            "${fruit.name} added to basket",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.orange.withOpacity(0.8),
                            colorText: Colors.white,
                          );
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF2E7),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset('assets/img/add_icon.png'),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
