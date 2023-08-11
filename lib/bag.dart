import 'package:flutter/material.dart';
import 'package:hellonong/body.dart';
import 'package:hellonong/symptoms.dart';
import 'package:hellonong/util/color_schemes.g.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'package:hellonong/widget/test.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'model/model.dart';

class Bag extends StatefulWidget {
  final List<Product> selectedProducts;
  Bag({required this.selectedProducts});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/body');
        break;
      case 2:
        Navigator.pushNamed(context, '/pharmacy');
        break;
      case 3:
        Navigator.pushNamed(context, '/mypage');
        break;
    }
  }

  Test test = Test(1);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 0, context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.075,
                  child: Image.asset(
                    "assets/images/bag.png",
                  ),
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFC1C1C1),
                      width: 1,
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: widget.selectedProducts.length,
                    itemBuilder: (context, index) {
                      Product product = widget.selectedProducts[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // 배경색을 하얀색으로 설정
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15.0, 3.0, 5.0, 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 18 / 14,
                              child: Image.asset(
                                'assets/images/sym/cheek/${product.id}.png',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height : screenHeight * 0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.42,
                      height: screenHeight * 0.0656,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 43,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(width : screenWidth * 0.03),
                    SizedBox(
                      width: screenWidth * 0.42,
                      height: screenHeight * 0.0656,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Symptoms(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
