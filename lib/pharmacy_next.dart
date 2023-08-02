import 'package:flutter/material.dart';
import 'package:hellonong/widget/test.dart';
import 'package:hellonong/widget/appbar.dart';

import 'bag.dart';
import 'home.dart';
import 'mypage.dart';
import 'widget/bottomNavi.dart';

class PharmacyNext extends StatelessWidget {
  final List<bool> isSelected1;
  final List<bool> isSelected2;
  final List<bool> isSelected3;
  final String selectedDuration;
  final String selectedImage1; // New property to store the selected image
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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isBeforeBreakfast = isSelected1.isNotEmpty ? isSelected1[0] : false;
    bool isAfterBreakfast = isSelected1.length > 1 ? isSelected1[1] : false;
    bool isBeforeLunch = isSelected2.isNotEmpty ? isSelected2[0] : false;
    bool isAfterLunch = isSelected2.length > 1 ? isSelected2[1] : false;
    bool isBeforeDinner = isSelected3.isNotEmpty ? isSelected3[0] : false;
    bool isAfterDinner = isSelected3.length > 1 ? isSelected3[1] : false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Next'),
      ),
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
                  selectedImage1, // Use the selected image for dropdownvalue1
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
                  selectedImage2, // Use the selected image for dropdownvalue1
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
                  selectedImage3, // Use the selected image for dropdownvalue1
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
                '$selectedDuration', // Display the selected duration
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
          Navigator.pop(context); // Go back to the previous screen
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
