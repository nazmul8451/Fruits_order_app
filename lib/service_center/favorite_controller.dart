import 'package:e_commerce_ui/models/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final items = <FruitItem>[
    FruitItem(imgPath: 'assets/img/fruits1.png', name: 'Honey lime combo', price: '999.00'),
    FruitItem(imgPath: 'assets/img/fruits2.png', name: 'Quinoa fruit salad', price: '444.77'),
  ].obs;
  final popularItems = <FruitItem>[
    FruitItem(imgPath: 'assets/img/fruits3.png', name: 'Chineese fruit ', price: '232.00'),
    FruitItem(imgPath: 'assets/img/fruits4.png', name: 'Soudian fruit fresh', price: '188.77'),
    FruitItem(imgPath: 'assets/img/fruits4.png', name: 'Soudian fruit fresh', price: '188.77'),
  ].obs;
  List<FruitItem> get favoriteItems =>[
  ...items.where((item) => item.isFavorite.value).toList(),
  ...popularItems.where((item) => item.isFavorite.value).toList(),
  ];

  //kno item favorite kina ta check korteci
  bool isFavorite(FruitItem item)=> item.isFavorite.value;

  void toggleFavorite(FruitItem item) {
    item.isFavorite.value = !item.isFavorite.value;
    if(items.contains(item)){
      items.refresh();
    }else if(popularItems.contains(item))
      {
        popularItems.refresh();
      }
  }
}