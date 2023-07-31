import 'package:flutter/material.dart';
import 'package:hellonong/widget/test.dart';

import 'bag.dart';
import 'mypage.dart';

class PharmacyNext extends StatefulWidget {
  final List<bool> isSelected1;
  final List<bool> isSelected2;
  final List<bool> isSelected3;

  const PharmacyNext({
    required this.isSelected1,
    required this.isSelected2,
    required this.isSelected3,
    Key? key,
  }) : super(key: key);

  @override
  State<PharmacyNext> createState() => _PharmacyNextState();
}

class _PharmacyNextState extends State<PharmacyNext> {
  Test test = Test(1);

  @override
  Widget build(BuildContext context) {
    // Get the selected values from the widget
    bool isBeforeBreakfast = widget.isSelected1[0];
    bool isAfterBreakfast = widget.isSelected1[1];
    bool isBeforeLunch = widget.isSelected2[0];
    bool isAfterLunch = widget.isSelected2[1];
    bool isBeforeDinner = widget.isSelected3[0];
    bool isAfterDinner = widget.isSelected3[1];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bag()),
              );
            },
            icon: Icon(
              Icons.list_alt_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage()),
              );
            },
            icon: Icon(
              Icons.person_outline,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // 하나의 그림 추가
          Container(
            height: 115,
            width: 110,
            child: Image.asset(
              "assets/images/morning.png", // 첫 번째 이미지 파일명
              width: 52,
              height: 52,
            ),
          ),

          SizedBox(height: 30),

          // Display the first image based on isSelected1
          Container(
            height: 115,
            width: 110,
            child: Image.asset(
              isBeforeBreakfast
                  ? "assets/images/beforerice.png"
                  : "assets/images/afterrice.png", // 첫 번째 이미지를 뒤집어서 표시
              width: 52,
              height: 52,
            ),
          ),
          SizedBox(height: 20),
          // Display the second image based on isSelected2
          Container(
            height: 115,
            width: 110,
            child: Image.asset(
              isBeforeLunch
                  ? "assets/images/beforerice.png"
                  : "assets/images/afterrice.png", // 두 번째 이미지를 뒤집어서 표시
              width: 52,
              height: 52,
            ),
          ),
          SizedBox(height: 20),
          // Display the third image based on isSelected3
          Container(
            height: 115,
            width: 110,
            child: Image.asset(
              isBeforeDinner
                  ? "assets/images/beforerice.png"
                  : "assets/images/afterrice.png", // 세 번째 이미지를 뒤집어서 표시
              width: 52,
              height: 52,
            ),
          ),
        ],
      ),
      bottomNavigationBar: test.bottmNavi(context),
    );
  }
}
