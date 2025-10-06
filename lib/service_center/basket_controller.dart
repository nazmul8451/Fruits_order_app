import 'package:e_commerce_ui/models/product_model.dart';
import 'package:get/get.dart';

class BasketController extends GetxController{
  //basket item list
  final basketItems =<FruitItem>[].obs;

  //item add method
  void addToBasket(FruitItem item){
    if(!basketItems.contains(item)){
      basketItems.add(item);
    }
  }

  //item remove method
  void removeBasketItem (FruitItem item)
  {
    basketItems.remove(item);
  }

  //total price method
double get totalPrice{
    double total = 0;
    for(var item in basketItems){
      total +=double.tryParse(item.price) ?? 0;
    }
    return total;
}


}