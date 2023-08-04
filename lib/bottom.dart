import 'package:flutter/material.dart';
import 'package:hellonong/sym_picture4/picture_hip.dart';
import 'package:hellonong/sym_picture4/picture_organ.dart';
import 'package:hellonong/sym_picture4/picture_pelvis.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';
import 'package:hellonong/widget/appbar.dart';

import 'home.dart';
import 'main.dart';
import 'mypage.dart';
import 'bag.dart';

class Bottom extends StatefulWidget {
  const Bottom ({super.key});


  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 1;

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
              left:screenWidth * 0.05,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
              );
            },
              child: Container(
                height: screenHeight * 0.35,
                width: screenWidth * 0.92,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bottom1.png'), // 첫 번째 사진 경로
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
              ),
            ),
            // 두 번째 사진
            Positioned(
              top:screenHeight * 0.42, // 첫 번째 사진과 겹치지 않게 위치 조정 (적절한 값으로 조정해보세요)
              left: screenWidth * 0.04, // 첫 번째 사진과 겹치지 않게 위치 조정 (적절한 값으로 조정해보세요)
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                  );
                },
              child: Container(
                height: screenHeight * 0.35, // 적절한 높이로 조정해보세요
                width: screenWidth * 0.92, // 적절한 너비로 조정해보세요
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bottom2.png'), // 두 번째 사진 경로
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
              ),
            ),
            Positioned(//골반
              bottom: screenHeight*0.55, // 아래 컨테이너 위에 20의 공간 추가
              left: screenWidth*0.05, // 왼쪽 컨테이너 위치 설정
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Picture_pelvis()), // Replace Page3 with the desired page
                  );
                },
              child: Container(
                width: screenWidth*0.92,
                height: screenHeight*0.16,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                ),
              ),
            ),
            ),
            Positioned(//생식기
              bottom: screenHeight*0.4, // 아래 컨테이너 위에 20의 공간 추가
              left: screenWidth*0.15, // 왼쪽 컨테이너 위치 설정
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Picture_organ()), // Replace Page3 with the desired page
                  );
                },
              child: Container(
                width: screenWidth*0.72,
                height: screenHeight*0.15,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                ),
              ),
              ),
            ),
            Positioned(//엉덩이
              bottom: screenHeight*0.035, // 아래 컨테이너 위에 20의 공간 추가
              left: screenWidth*0.05, // 왼쪽 컨테이너 위치 설정
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Picture_hip()), // Replace Page3 with the desired page
                  );
                },
              child: Container(
                width: screenWidth*0.91,
                height: screenHeight*0.2,
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
