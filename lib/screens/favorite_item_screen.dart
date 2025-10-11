import 'package:e_commerce_ui/service_center/favorite_controller.dart';
import 'package:e_commerce_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
class FavoriteItemScreen extends StatelessWidget {

   FavoriteItemScreen({super.key});
  static const String name = '/favorite-screen';

  final List<Color> colorForContainer = [
    const Color(0xFFFFFAEB),
    const Color(0xFFFEF0F0),
    const Color(0xFFF1EFF6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: ()=> Navigator.pop(context),
        ),
        backgroundColor: Color(0xFFFFA451),
        title:Text('My Favorite',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Consumer<FavoriteItemController>(
          builder: (context,controller,child){
        final favorites = controller.favoriteItems;
        if(favorites.isEmpty){
          return Center(
            child: Text('No favorites yet'),
          );
        }
        return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context,index){
              final fruits = favorites[index];
              if(favorites.isEmpty){
                return Center(
                  child: Text('No favorites yet'),
                );
              }
              return  Column(
                  key :ValueKey(fruits.name),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80, // ekhane height set kora
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: colorForContainer[index % colorForContainer.length],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              fruits.imgPath,
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            fruits.name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite, color: Colors.orange),
                          onPressed: () {
                            controller.toggleFavorite(fruits);
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[200],
                  )
                ],
              );
            });
      }



      ),//
    );
  }


}
