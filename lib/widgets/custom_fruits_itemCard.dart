
import 'package:flutter/material.dart';
class Custom_fruit_card extends StatelessWidget {
  const Custom_fruit_card({
    super.key,
    required this.width,
    required this.colorForCard,
    required this.heigth,
    required this.imgPath,
  });
  final String imgPath;
  final double width;
  final Color colorForCard;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: width * 0.40,

        margin:const EdgeInsets.only(right:10) ,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorForCard,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                //img
                Container(
                  padding: EdgeInsets.all(4),
                  height: 70,
                  width: double.infinity,
                  child: Image.asset('assets/img/fruits4.png'),
                ),
                //favorite icon for card
                Positioned(
                  right: 8,
                  top: 4,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                    size: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: heigth * 0.01),
            Center(
              child: Text(
                'Quinoa fruit salad',
                style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: heigth * 0.02),
            Row(
              children: [
                Image.asset(
                  'assets/img/money_icon_for_card.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 5),
                Text(
                  '2000',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFF08626),
                  ),
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2E7),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset('assets/img/add_icon.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
