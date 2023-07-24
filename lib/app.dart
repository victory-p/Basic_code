import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hellonong/widget/bottomNavi.dart';

import 'home.dart';
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
      home: const BottomNavi(),
    );
  }
}