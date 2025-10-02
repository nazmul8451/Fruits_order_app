
import 'package:e_commerce_ui/app.dart';
import 'package:e_commerce_ui/screens/add_basket_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => AddBasketScreen()
    ),
  );
}
