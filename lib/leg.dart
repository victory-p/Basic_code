import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';

import 'home.dart';
import 'main.dart';
import 'mypage.dart';
import 'bag.dart';

class  leg extends StatefulWidget {
  const leg ({super.key});


  @override
  State<leg> createState() => _legState();
}

class _legState extends State<leg> {
  Test test = Test(1);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Bag() //page 간 이동
                ));},
              icon:Icon(
                Icons.list_alt_rounded,
                size: 40,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => MyPage()));},
              icon:Icon(
                Icons.person_outline,
                size: 40,
                color: Colors.white,
              )
          )
        ],
      ),
      body:
      Align(
        alignment: Alignment.center, // 가운데 정렬
        child: Container(//얼굴사진
          height: screenHeight*0.75, // 높이를 150으로 변경
          width: screenWidth*0.6,
          margin: EdgeInsets.only(top: screenHeight*0.01),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/leg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(//허벅지
                bottom: screenHeight*0.46, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.01, // 왼쪽 컨테이너 위치 설정
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                );
              },
                child: Container(
                  width: screenWidth*0.58,
                  height: screenHeight*0.28,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                  ),
                ),
              ),
              ),
              Positioned(//무릎
                bottom: screenHeight*0.375, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.05, // 왼쪽 컨테이너 위치 설정
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth*0.505,
                  height: screenHeight*0.08,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                  ),
                ),
              ),
              ),
              Positioned(//종아리
                bottom: screenHeight*0.16, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.05, // 왼쪽 컨테이너 위치 설정
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth*0.49,
                  height: screenHeight*0.205,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                  ),
                ),
              ),
              ),
              Positioned(//발목
                bottom: screenHeight * 0.08, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.05, // 왼쪽 컨테이너 위치 설정
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth*0.48,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // 투명도 조정 (0.0 ~ 1.0 사이의 값)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(102, 102, 102, 1.0), width: 1.0), // 보더 색상 설정
                  ),
                ),
              ),
              ),
              Positioned(//발
                bottom: screenHeight * 0, // 아래 컨테이너 위에 20의 공간 추가
                left: screenWidth*0.01, // 왼쪽 컨테이너 위치 설정
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace Page3 with the desired page
                    );
                  },
                child: Container(
                  width: screenWidth*0.55,
                  height: screenHeight * 0.075,
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
      )

    );
  }
}
