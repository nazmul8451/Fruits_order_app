
import 'package:e_commerce_ui/app.dart';
import 'package:e_commerce_ui/service_center/basket_controller.dart';
import 'package:e_commerce_ui/service_center/favorite_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
void main() {
  Get.put(FavoriteController());
  Get.put(BasketController());
  runApp(
      DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => E_CommerceApp()
    ),
  );
}
