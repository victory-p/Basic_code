import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';


import 'bag.dart';
import 'main.dart';
import 'mypage.dart';

class Result extends StatefulWidget {
  const Result({Key? key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
      appBar: CustomAppBar(0,0, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter, // 컨테이너를 화면 상단에 정렬
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFC1C1C1),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth * 0.05,
                          top: screenHeight * 0.02,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
            SizedBox(height: 20), // 두 컨테이너 사이에 간격 추가
            Align(
              alignment: Alignment.topCenter, // 컨테이너를 화면 상단에 정렬
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFC1C1C1),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                      Positioned(
                      left: screenWidth * 0.05,
                      top: screenHeight * 0.02,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary, // 파랑색으로 변경
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Color(0xFFC1C1C1),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50, // 아이콘 크기 조정
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
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
