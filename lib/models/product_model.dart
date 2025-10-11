import 'package:get/get.dart';

class FruitItem {
  final String name;
  final String imgPath;
  final String price;
  var isFavorite = false;

  FruitItem({
    required this.imgPath,
    required this.name,
    required this.price,
    bool favorite = false, // optional initial value
  });
}
