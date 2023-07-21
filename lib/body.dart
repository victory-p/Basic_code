import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              onPressed: (){/*
                Navigator.push(context,MaterialPageRoute(builder: (context) => Bag() //page 간 이동
                ));*/},
              icon:Icon(
                Icons.list_alt_rounded,
                size: 40,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: (){/*Navigator.push(context,MaterialPageRoute(builder: (context) => MyPage()));*/},
              icon:Icon(
                Icons.person_outline,
                size: 40,
                color: Colors.white,
              )
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: screenWidth * 0.9,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/body.png',
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: screenHeight * 0.75,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: screenHeight * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '첫 번째 줄',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    '두 번째 줄 1번째',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: screenWidth * 0.3,
                                      height: screenHeight * 0.175,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '두 번째 줄 2번째 (상단)',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: screenWidth * 0.3,
                                      height: screenHeight * 0.175,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '두 번째 줄 2번째 (하단)',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    '두 번째 줄 3번째',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: screenWidth * 0.5,
                            height: screenHeight * 0.33,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '세 번째 줄',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined, size: 45,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 50,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.capsules, size: 45,),
            label: '',
          ),
        ],
        currentIndex: 0,
        unselectedItemColor: Color(0xFFBEBEBE),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          // Add navigation logic here
        },
      ),
    );
  }
}