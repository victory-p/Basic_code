import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/test.dart';

import 'bag.dart';
import 'mypage.dart';
import 'widget/bottomNavi.dart';

class Usage extends StatefulWidget {
  const Usage({Key? key}) : super(key: key);

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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

  Test test = Test(1);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(1,0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFC1C1C1),
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: screenHeight * 0.028,
                  right: screenWidth * 0.05,
                  child: Container(
                    width: screenWidth * 0.78,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 37,
                      ),
                    ),
                  ),
                ),
              ],
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
