import 'package:flutter/material.dart';
import 'package:hellonong/util/color_schemes.g.dart';

import 'mypage.dart';
import 'bag.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Bag() //page 간 이동
                  ));},
                icon:Icon(
                  Icons.list_alt_rounded,
                  size: 40,
                  color: Colors.white,
                )
            ),
            IconButton(
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => MyPage()));},
                icon:Icon(
                  Icons.person_outline,
                  size: 40,
                  color: Colors.white,
                )
            )
          ],
        ),
        body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 178,
                    child: Image.asset(
                      "assets/images/Frame 2608516.png",
                      width: 72,
                      height: 72,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3)
                          )
                        ]
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text("병원")),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 150,
                    width: 178,
                    child: Image.asset(
                      "assets/images/Pharmacy.png",
                      width: 72,
                      height: 72,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3)
                          )
                        ]
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text("약국")),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 150,
                    width: 178,
                    child: Image.asset(
                      "assets/images/Zoom in.png",
                      width: 72,
                      height: 72,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3)
                          )
                        ]
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text("사용방법")),
                ],
              ),
            )
        )
    );
  }
}