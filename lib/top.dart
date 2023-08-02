import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';

import 'home.dart';
import 'main.dart';
import 'mypage.dart';
import 'bag.dart';

class  Top extends StatefulWidget {
  const Top ({super.key});


  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
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
      body:
      Align(
        alignment: Alignment.center, // 가운데 정렬

          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.02,
                left:screenWidth * 0.2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                );
              },
                child: Container(
                  height: screenHeight * 0.35,
                  width: screenWidth * 0.65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/top1.png'), // 첫 번째 사진 경로
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ),
              ),
              // 두 번째 사진
              Positioned(
                top:screenHeight * 0.4, // 첫 번째 사진과 겹치지 않게 위치 조정 (적절한 값으로 조정해보세요)
                left: screenWidth * 0.24,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },// 첫 번째 사진과 겹치지 않게 위치 조정 (적절한 값으로 조정해보세요)
                child: Container(
                  height: screenHeight * 0.35, // 적절한 높이로 조정해보세요
                  width: screenWidth * 0.57, // 적절한 너비로 조정해보세요
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/top2.png'), // 두 번째 사진 경로
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ),
              Positioned(//머리
                bottom: screenHeight*0.57, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },// 왼쪽 컨테이너 위치 설정
                child: Container(
                  width: screenWidth*0.65,
                  height: screenHeight*0.16,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                  ),
                ),
              ),
              ),
              Positioned(//눈
                bottom: screenHeight*0.4, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },// 왼쪽 컨테이너 위치 설정
                child: Container(
                  width: screenWidth*0.545,
                  height: screenHeight*0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                  ),
                ),
              ),
              ),
              Positioned(//코
                bottom: screenHeight*0.05, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.225, // 왼쪽 컨테이너 위치 설정
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth*0.6,
                  height: screenHeight*0.3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
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
