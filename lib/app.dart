import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hellonong/widget/bottomNavi.dart';

import 'body.dart';
import 'home.dart';
import 'myPage.dart';
import 'pharmacy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/body': (context) => TestScreen(),
        '/pharmacy': (context) => Pharmacy(isSelected1: [], isSelected2: [], isSelected3: []),
        '/mypage': (context) => MyPage(),
      },
    );
  }
}