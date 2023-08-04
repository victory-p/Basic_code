import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/model/model.dart';
import 'package:hellonong/model/chest_sym.dart';
import 'package:hellonong/widget/bottomNavi.dart';

import '../home.dart';

class Picture_waist extends StatefulWidget {
  const Picture_waist({Key? key}) : super(key: key);

  @override
  State<Picture_waist> createState() => _Picture_waistState();
}

class _CardState {
  bool isChecked;

  _CardState({this.isChecked = false}); // isChecked를 선택적으로 받도록 변경
}


class _Picture_waistState extends State<Picture_waist> {
  int _selectedIndex = 1; // 바텀 네비게이션 바의 인덱스를 나타냄

  // 바텀 네비게이션 바를 클릭할 때 호출되는 메서드
  void _onItemTapped(int index) {
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

  List<_CardState> cardStates = List.generate(10, (_) => _CardState());

  List<Widget> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.chest);

    if (products.isEmpty) {
      return const <Widget>[];
    }

    List<Product> filteredProducts = products.where((product) => product.id.startsWith('3-')).toList();

    return filteredProducts.map((product) {
      int index = int.parse(product.id.split('-')[1]); // Parse the string to get the integer index
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.black, width: 1.2), // 테두리의 색상과 두께 설정
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white, // 카드 내부 컨텐츠의 배경색을 흰색으로 설정
          child: Stack(
            // Stack을 사용하여 체크박스와 이미지 겹치기
            children: <Widget>[
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 18 / 15,
                      child: Image.asset(
                        //fit: BoxFit.fitWidth,
                        'assets/images/sym/waist/${product.id}.png', // 이미지 가져오기
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 4.0,
                right: 4.0,
                child: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        cardStates[index].isChecked =
                        !cardStates[index].isChecked;
                      });
                    },
                    icon: cardStates[index].isChecked
                        ? Icon(Icons.check_box)
                        : Icon(Icons.check_box_outline_blank),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 0, context),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: screenWidth / (screenHeight * 0.531),
        children: _buildGridCards(context),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/images/checkbox.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
