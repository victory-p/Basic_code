import 'package:flutter/material.dart';
import 'package:hellonong/widget/test.dart';

import 'bag.dart';
import 'home.dart';
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
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    // Get the selected values from the widget
    bool isBeforeBreakfast = widget.isSelected1.isNotEmpty ? widget.isSelected1[0] : false;
    bool isAfterBreakfast = widget.isSelected1.length > 1 ? widget.isSelected1[1] : false;
    bool isBeforeLunch = widget.isSelected2.isNotEmpty ? widget.isSelected2[0] : false;
    bool isAfterLunch = widget.isSelected2.length > 1 ? widget.isSelected2[1] : false;
    bool isBeforeDinner = widget.isSelected3.isNotEmpty ? widget.isSelected3[0] : false;
    bool isAfterDinner = widget.isSelected3.length > 1 ? widget.isSelected3[1] : false;

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
          SizedBox(height: screenHeight * 0.075),
          Row(
            children: [
              // 첫 번째 이미지와 밥 전/후 이미지를 나란히 표시
              Image.asset(
                width: screenWidth * 0.28,
                height: screenHeight * 0.2,
                "assets/images/morning.png",
              ),
              SizedBox(width: 35),
              Image.asset(
                isBeforeBreakfast ? "assets/images/beforerice.png" : "assets/images/afterrice.png",
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
              ),
              Image.asset(
                "assets/images/30mintues.png",
                width: screenWidth * 0.33,
                height: screenHeight * 0.2,
              ),
            ],
          ),
          Row(
            children: [
              // 두 번째 이미지와 밥 전/후 이미지를 나란히 표시
              Image.asset(
                "assets/images/afternoon.png",
                width: screenWidth * 0.28,
                height: screenHeight * 0.2,
              ),
              SizedBox(width: 35),
              Image.asset(
                isBeforeLunch ? "assets/images/beforerice.png" : "assets/images/afterrice.png",
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
              ),
              Image.asset(
                "assets/images/30mintues.png",
                width: screenWidth * 0.33,
                height: screenHeight * 0.2,
              ),
            ],
          ),
          Row(
            children: [
              // 세 번째 이미지와 밥 전/후 이미지를 나란히 표시
              Image.asset(
                "assets/images/evening.png",
                width: screenWidth * 0.28,
                height: screenHeight * 0.2,
              ),
              SizedBox(width: 35),
              Image.asset(
                isBeforeDinner ? "assets/images/beforerice.png" : "assets/images/afterrice.png",
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
              ),
              Image.asset(
                "assets/images/30mintues.png",
                width: screenWidth * 0.33,
                height: screenHeight * 0.2,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(), // Replace HomeScreen with the appropriate widget from home.dart
            ),
          );
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/images/checkbox.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottomNavigationBar: test.bottmNavi(context),
    );
  }
}
