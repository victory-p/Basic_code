import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bag.dart';
import '../home.dart';
import '../mypage.dart';

class CustomAppBar extends AppBar {
  final int selectedIndex;
  final BuildContext context; // context를 멤버 변수로 추가합니다.

  CustomAppBar(this.selectedIndex, this.context) // 생성자에서 context를 전달받도록 수정합니다.
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
          // Navigate to the Bag page when the first icon button is pressed.
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
      IconButton(
        onPressed: () {
          // Navigate to the MyPage when the second icon button is pressed.
          if (selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Bag()),
            );
          }
        },
        icon: Icon(
          Icons.help_outline,
          size: 40,
          color: Colors.white,
        ),
      ),
    ],
  );
}
