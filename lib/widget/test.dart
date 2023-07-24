import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home.dart';

class Test {
  late final int _selectedIndex;

  Test(this._selectedIndex);

  void _onItemTapped(int index, BuildContext context) {
    _selectedIndex = index;
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    }
  }

  Widget bottmNavi(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 3), // Offset in the y direction
          ),
        ],
      ),
      child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined, size: 45,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size:  50,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.capsules, size: 45,),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xFFBEBEBE),
          //unselectedItemColor: Colors.deepPurpleAccent,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: (int index) {
            _onItemTapped(index, context);
          }
      ),
    );
  }
}

