import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:provider/provider.dart';

import 'body.dart';
import 'home.dart';
import 'myPage.dart';
import 'pharmacy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyAppState>(
      create: (context) => MyAppState(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => MyHomePage(),
          '/body': (context) => TestScreen(),
          '/pharmacy': (context) => Pharmacy(
                isSelected1: [],
                isSelected2: [],
                isSelected3: [],
              ),
          '/mypage': (context) => MyPage(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<String> bags = [];
  List<String> imageURLs = [];
  List<String> ids = [];

  int get favoriteCount => bags.length; // 즐겨찾기한 상품의 개수를 리스트의 길이로 계산

  List<String> wishids = [];

  void toggleBags(String name, String description, String imageURL, String id,) {
    if (bags.contains(name)) {
      bags.remove(name);
      imageURLs.remove(imageURL);
      ids.remove(id);
    } else {
      bags.add(name);
      imageURLs.add(imageURL);
      ids.add(id);
    }
    notifyListeners();
  }
}