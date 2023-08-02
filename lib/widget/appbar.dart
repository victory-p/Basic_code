import 'package:flutter/material.dart';
import '../bag.dart';
import '../usage.dart';

class CustomAppBar extends AppBar {
  final int _buttonIndex;
  final int selectedIndex;
  final BuildContext context; // context를 멤버 변수로 추가합니다.

  CustomAppBar(this._buttonIndex, this.selectedIndex, this.context)
      : super(
    leading: IconButton(
      onPressed: () {
        // Navigate back when the back button is pressed.
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 40,
        color: Colors.white,
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    actions: [
      IconButton(
        onPressed: () {
          // Navigate to the Bag page when the button is pressed.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bag()),
          );
        },
        icon: Container(
          width: 42, // 이미지의 너비
          height: 42, // 이미지의 높이
          child: Stack(
            children: [
              Image.asset(
                'assets/images/list.png', // 리스트 아이콘 이미지 파일의 경로
                width: 42, // 이미지의 너비
                height: 42, // 이미지의 높이
              ),
              Positioned(
                top: 0, // 동그라미의 위치를 조정하여 겹치도록 설정
                right: 0, // 동그라미의 위치를 조정하여 겹치도록 설정
                child: Container(
                  width: 20, // 동그라미의 너비와 높이 설정 (원하는 크기로 조정)
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB41212), // 진한 빨간색
                  ),
                  child: Center(
                    child: Text(
                      '0', // 동그라미 안에 들어갈 내용 (원하는 텍스트로 변경 가능)
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14, // 텍스트 크기 조정
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          // Navigate to the Usage or other page based on the _buttonIndex value.
          if (selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Usage()),
            );
          } else {
            // Handle other cases based on _buttonIndex value.
            // For example, add more conditions or navigate to different pages.
          }
        },
        icon: _buttonIndex == 1
            ? Icon(
          Icons.help,
          size: 40,
          color: Colors.white,
        )
            : Icon(
          Icons.help_outline,
          size: 40,
          color: Colors.white,
        ),
      ),
    ],
  );
}
