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
  List<String> wishs = [];
  List<String> sym = [];
  List<String> picture = [];
  List<String> imageURLs = [];
  List<String> ids = [];
  int favoriteCount = 41;
  List<String> wishids = [];

  void toggleWish(
    String name,
    String price,
    String description,
    String imageURL,
    String id,
  ) {
    if (wishs.contains(name)) {
      wishs.remove(name);
      sym.remove(price);
      picture.remove(description);
      imageURLs.remove(imageURL);
      ids.remove(id);
      //FirebaseFirestore.instance.collection('WiSH').doc(id).delete();
    } else {
      wishs.add(name);
      sym.add(price);
      picture.add(description);
      imageURLs.add(imageURL);
      ids.add(id);
    }
    notifyListeners();
  }

  void toggleFavorite() {
    notifyListeners();
  }

  void incNum() {
    favoriteCount++;
    notifyListeners();
  }

  void decNum() {
    favoriteCount--;
    notifyListeners();
  }
}
