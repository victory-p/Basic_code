import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hellonong/widget/test.dart';
import 'package:hellonong/widget/appbar.dart';

import 'home.dart';
import 'myPage.dart';
import 'bag.dart';
import 'face.dart';
import 'leftArm.dart';
import 'rightArm.dart';
import 'top.dart';
import 'bottom.dart';
import 'leg.dart';
import 'widget/bottomNavi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: CustomAppBar(0,0, context,),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: screenWidth * 0.9,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/body.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: screenHeight * 0.75,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Face()),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: screenHeight * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => leftArm()),
                                    );
                                  },
                                  child: Container(
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.35,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Top()),
                                          );
                                        },
                                        child: Container(
                                          width: screenWidth * 0.3,
                                          height: screenHeight * 0.175,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.black, width: 2),
                                            borderRadius: BorderRadius.circular(
                                                20),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Bottom()),
                                          );
                                        },
                                        child: Container(
                                          width: screenWidth * 0.3,
                                          height: screenHeight * 0.175,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.black, width: 2),
                                            borderRadius: BorderRadius.circular(
                                                20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => rightArm()),
                                    );
                                  },
                                  child: Container(
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.35,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => leg()),
                                );
                              },
                              child: Container(
                                width: screenWidth * 0.5,
                                height: screenHeight * 0.33,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
