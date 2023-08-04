import 'package:flutter/material.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';
import 'package:hellonong/widget/appbar.dart';

import 'bag.dart';
import 'home.dart';
import 'mypage.dart';
import 'widget/bottomNavi.dart';

class PharmacyNext extends StatefulWidget {
  final List<bool> isSelected1;
  final List<bool> isSelected2;
  final List<bool> isSelected3;
  final String selectedDuration;
  final String selectedImage1; // 새로운 속성으로 선택된 이미지 저장
  final String selectedImage2;
  final String selectedImage3;

  PharmacyNext({
    required this.isSelected1,
    required this.isSelected2,
    required this.isSelected3,
    required this.selectedDuration,
    required this.selectedImage1,
    required this.selectedImage2,
    required this.selectedImage3,
    Key? key,
  }) : super(key: key);

  @override
  _PharmacyNextState createState() => _PharmacyNextState();
}

class _PharmacyNextState extends State<PharmacyNext> {
  int _selectedIndex = 2; // 바텀 네비게이션 바의 인덱스를 나타냄

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/body');
        break;
      case 2:
        Navigator.pushNamed(context, '/pharmacy');
        break;
      case 3:
        Navigator.pushNamed(context, '/mypage');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isBeforeBreakfast = widget.isSelected1.isNotEmpty ? widget.isSelected1[0] : false;
    bool isAfterBreakfast = widget.isSelected1.length > 1 ? widget.isSelected1[1] : false;
    bool isBeforeLunch = widget.isSelected2.isNotEmpty ? widget.isSelected2[0] : false;
    bool isAfterLunch = widget.isSelected2.length > 1 ? widget.isSelected2[1] : false;
    bool isBeforeDinner = widget.isSelected3.isNotEmpty ? widget.isSelected3[0] : false;
    bool isAfterDinner = widget.isSelected3.length > 1 ? widget.isSelected3[1] : false;

    return Scaffold(
      appBar: CustomAppBar(0, 0, context),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/morning.png',
                  width: screenWidth * 0.28,
                  height: screenHeight * 0.2,
                ),
                SizedBox(width: 35),
                Image.asset(
                  isBeforeBreakfast ? 'assets/images/beforerice.png' : 'assets/images/afterrice.png',
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                ),
                Image.asset(
                  widget.selectedImage1, // Use the selected image for dropdownvalue1
                  width: screenWidth * 0.33,
                  height: screenHeight * 0.2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/afternoon.png',
                  width: screenWidth * 0.28,
                  height: screenHeight * 0.2,
                ),
                SizedBox(width: 35),
                Image.asset(
                  isBeforeLunch ? 'assets/images/beforerice.png' : 'assets/images/afterrice.png',
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                ),
                Image.asset(
                  widget.selectedImage2, // Use the selected image for dropdownvalue1
                  width: screenWidth * 0.33,
                  height: screenHeight * 0.2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/evening.png',
                  width: screenWidth * 0.28,
                  height: screenHeight * 0.2,
                ),
                SizedBox(width: 35),
                Image.asset(
                  isBeforeDinner ? 'assets/images/beforerice.png' : 'assets/images/afterrice.png',
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                ),
                Image.asset(
                  widget.selectedImage3, // Use the selected image for dropdownvalue1
                  width: screenWidth * 0.33,
                  height: screenHeight * 0.2,
                ),
              ],
            ),
          ),
          SizedBox(height: 0),
          Container(
            alignment: Alignment.center,
            width: screenWidth * 0.4,
            height: screenHeight * 0.075,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${widget.selectedDuration}', // Display the selected duration
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
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
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
