import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';

import 'main.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  Test test = Test(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bag()),
              );
            },
            icon: Icon(
              Icons.list_alt_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 335,
          height: 610,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFFC1C1C1),
              width: 1,
            ),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 20, // 이미지 위에 20의 공간 추가
                child: Image.asset(
                  "assets/images/bag.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Positioned(
                bottom: 25, // 아래 컨테이너 위에 20의 공간 추가
                left: 20, // 왼쪽 컨테이너 위치 설정
                child: Container(
                  width: 135,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 37, // 아이콘 크기 조정
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 25, // 아래 컨테이너 위에 20의 공간 추가
                right: 20, // 오른쪽 컨테이너 위치 설정
                child: Container(
                  width: 135,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 37, // 아이콘 크기 조정
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: test.bottmNavi(context),

    );
  }
}


