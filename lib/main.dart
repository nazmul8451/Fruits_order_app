import 'package:e_commerce_ui/app.dart';
import 'package:e_commerce_ui/screens/log_in_screen.dart';
import 'package:e_commerce_ui/service_center/basket_controller.dart';
import 'package:e_commerce_ui/service_center/favorite_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>FavoriteItemController()),
          ChangeNotifierProvider(create: (_)=>BasketController())
        ],
        child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>  E_CommerceApp()
    ),)

  );
}
