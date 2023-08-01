import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';
import 'package:hellonong/widget/appbar.dart';

import 'main.dart';
import 'mypage.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  Test test = Test(1);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0,0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFC1C1C1),
                width: 1,
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Image.asset(
                    "assets/images/bag.png",
                    width: screenWidth * 0.12,
                    height: screenHeight * 0.095,
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.028,
                  left: screenWidth * 0.05,
                  child: Container(
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 37,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.028,
                  right: screenWidth * 0.05,
                  child: Container(
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 37,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
