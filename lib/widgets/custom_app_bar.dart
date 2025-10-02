import 'package:flutter/material.dart';
class MyAppBart extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFFFFA451), title: Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: Container(
          width: 90,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                Icon(Icons.arrow_back_ios,size: 15,),
                Text('Go back',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
              ],),
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
