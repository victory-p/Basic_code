import 'package:flutter/material.dart';
import 'package:hellonong/sym_picture/picture_eye.dart';
import 'package:hellonong/sym_picture/picture_head.dart';
import 'package:hellonong/sym_picture/picture_nose.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';

import 'main.dart';
import 'mypage.dart';
import 'bag.dart';
import 'home.dart';
import 'symptoms_category.dart';

class  Face extends StatefulWidget {
  const Face ({super.key});


  @override
  State<Face> createState() => _FaceState();
}

class _FaceState extends State<Face> {
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
              child: Container(//얼굴사진
                height: screenHeight*0.6, // 높이를 150으로 변경
                width: screenWidth*0.73,
                margin: EdgeInsets.only(top: screenHeight*0.08),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/face.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                Positioned(//머리
                  bottom: screenHeight*0.4, // 아래 컨테이너 위에 20의 공간 추가
                  left: screenWidth*0.01, // 왼쪽 컨테이너 위치 설정
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Picture_head()), // Replace Page3 with the desired page
                      );
                    },
                  child: Container(
                    width: screenWidth*0.7,
                    height: screenHeight*0.18,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                    ),
                  ),
                ),
                ),
                    Positioned(//눈
                      bottom: screenHeight*0.295, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.073, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Picture_eye()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.585,
                        height: screenHeight*0.09,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                      ),
                    ),
                    Positioned(//코
                      bottom: screenHeight*0.2, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.291, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Picture_nose()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.145,
                        height: screenHeight*0.08,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//왼쪽 귀
                      bottom: screenHeight*0.25, // 아래 컨테이너 위에 20의 공간 추가
                      left: 0, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.07,
                        height: screenHeight*0.12,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//오른쪽 귀
                      bottom: screenHeight*0.25, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.66, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.07,
                        height: screenHeight*0.12,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//오른쪽 볼
                      bottom: screenHeight*0.2,
                      left: screenWidth*0.445, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.184,
                        height: screenHeight*0.08,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//왼쪽 볼
                      bottom: screenHeight * 0.2, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.1, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.184,
                        height: screenHeight*0.08,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//입술
                      bottom: screenHeight * 0.135, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.2, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.32,
                        height: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//턱
                      bottom: screenHeight * 0.065, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.2, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.32,
                        height: screenHeight * 0.065,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                        ),
                      ),
                    ),
                    ),
                    Positioned(//목
                      bottom: screenHeight * 0.01, // 아래 컨테이너 위에 20의 공간 추가
                      left: screenWidth*0.15, // 왼쪽 컨테이너 위치 설정
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                          );
                        },
                      child: Container(
                        width: screenWidth*0.43,
                        height: screenHeight * 0.05,
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
    ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
