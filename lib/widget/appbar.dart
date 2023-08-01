import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bag.dart';
import '../home.dart';
import '../mypage.dart';
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
