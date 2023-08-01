import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hellonong/home.dart';

import '../app.dart';
import '../myPage.dart';
import '../pharmacy.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    MyApp(),
    Pharmacy(isSelected1: [], isSelected2: [], isSelected3: [],),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,size:  50,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined,size: 45,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.capsules, size: 45,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user, size: 45,),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xFFBEBEBE),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
