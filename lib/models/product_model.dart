import 'package:get/get.dart';

class FruitItem {
  final String name;
  final String imgPath;
  final String price;
  var isFavorite = false.obs;

  FruitItem({
    required this.imgPath,
    required this.name,
    required this.price,
    bool favorite = false, // optional initial value
  }) {
    isFavorite.value = favorite;
  }
}
