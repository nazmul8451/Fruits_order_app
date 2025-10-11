import 'package:e_commerce_ui/models/product_model.dart';
import 'package:flutter/cupertino.dart';


class BasketController extends ChangeNotifier{
  //basket item list
  final basketItems =<FruitItem>[];

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