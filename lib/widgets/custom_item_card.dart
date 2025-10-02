import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  String imgPath ;
  CustomCard({
    super.key,
    required this.width,
    required this.heigth,
    required this.imgPath,
  });

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.42,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 9,
            spreadRadius: 1,
            offset: Offset(1, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: ClipRect(
                    child: Image.asset(
                      imgPath,
                      width: double.infinity,
                      height: heigth * 0.25,
                    ),
                  ),
                ),
              ),
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
              "Honey lime combo",
              style: TextStyle(
                fontSize: width * 0.04, // responsive font
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: heigth * 0.01),
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
                    child: Image.asset(
                      'assets/img/add_icon.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
