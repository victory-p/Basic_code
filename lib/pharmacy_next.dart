import 'package:flutter/material.dart';
import 'package:hellonong/widget/test.dart';

import 'bag.dart';
import 'mypage.dart';
import 'pharmacy.dart';

class Pharmacy_next extends StatefulWidget {
  const Pharmacy_next({super.key});

  @override
  State<Pharmacy_next> createState() => _Pharmacy_nextState();
}

class _Pharmacy_nextState extends State<Pharmacy_next> {
  Test test = Test(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bag()));
              },
              icon: Icon(
                Icons.list_alt_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPage()));
              },
              icon: Icon(
                Icons.person_outline,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(


        ),
      bottomNavigationBar: test.bottmNavi(context),

    );
  }
  }
