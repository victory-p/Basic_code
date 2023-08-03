import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hellonong/usage.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/bottomNavi.dart';


import 'body.dart';
import 'mypage.dart';
import 'bag.dart';
import 'pharmacy.dart'; // 혹은 필요 없는 경우 주석 처리

// import 'test_screen.dart'; // TestScreen widget가 필요한 경우 주석 해제

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // 바텀 네비게이션 바의 인덱스를 나타내는

  // 바텀 네비게이션 바를 클릭할 때 호출되는 메서드
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
      appBar: CustomAppBar(0,0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
          child: Column(
            children: [
              SizedBox(
                  height: screenHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestScreen()), // 필요한 경우 주석 해제
                  );
                },
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.28,
                  child: Image.asset(
                    "assets/images/Frame 2608516.png",
                    width: 72,
                    height: 72,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("병원",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pharmacy(isSelected1: [], isSelected2: [], isSelected3: [],)),
                  );
                },
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.28,
                  child: Image.asset(
                    "assets/images/Pharmacy.png",
                    width: 100,
                    height: 100,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("약국",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
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
