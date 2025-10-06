import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback ? onBack;

  const MyAppBar({
    super.key,
    this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFFFFA451), title: Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: GestureDetector(
          onTap: onBack ?? () => Get.back(),
          child: Container(
            width: 90,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: [
                      Icon(Icons.arrow_back_ios, size: 15,),
                      Text('Go back', style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),),
                    ],
                    ),
                  ),
                ),

                Expanded(child: Center(
                    child: title != null ? Text(
                  title!, style: TextStyle(fontSize: 18, fontWeight: FontWeight
                    .bold, color: Colors.white),):const SizedBox.shrink()))
              ],
            ),
          ),
        ),
      ),
    )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
