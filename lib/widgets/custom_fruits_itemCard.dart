
import 'package:e_commerce_ui/models/product_model.dart';
import 'package:e_commerce_ui/service_center/basket_controller.dart';
import 'package:e_commerce_ui/service_center/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Custom_fruit_card extends StatelessWidget {
   Custom_fruit_card({
    super.key,
    required this.width,
    required this.colorForCard,
    required this.heigth,
    required this.imgPath,
     required this.fruit,
  });
  final String imgPath;
  final double width;
  final Color colorForCard;
  final double heigth;
  final FavoriteController controller = Get.find();
  final BasketController basketController = Get.find();
  FruitItem fruit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: width * 0.40,
        margin:const EdgeInsets.only(right:10) ,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorForCard,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(()=> IconButton(
                    onPressed: (){
                      controller.toggleFavorite(fruit);
                    },
                    icon:Icon(
                      fruit.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(4),
              height: 50,
              width: double.infinity,
              child: Image.asset(fruit.imgPath,),
            ),
            //favorite icon for card
            Center(
              child: Text(
                fruit.name,
                style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
            SizedBox(height: heigth * 0.01),
            Row(
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
                Container(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
