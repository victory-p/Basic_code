import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hellonong/bag.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/model/model.dart';
import 'package:hellonong/model/head_sym.dart';
import 'package:hellonong/widget/bottomNavi.dart';

import '../home.dart';

class Picture_cheek extends StatefulWidget {
  const Picture_cheek({Key? key}) : super(key: key);

  @override
  State<Picture_cheek> createState() => _Picture_cheekState();
}

class _CardState extends ChangeNotifier {
  bool isChecked;
  String name;

  _CardState({this.isChecked = false, required this.name});
  void toggleChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }
}

class _Picture_cheekState extends State<Picture_cheek> {
  int _selectedIndex = 1;

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
  List<_CardState> cardStates = [];

  @override
  void initState() {
    super.initState();
    List<Product> products = ProductsRepository.loadProducts(Category.cheek);
    List<Product> filteredProducts =
    products.where((product) => product.id.startsWith('7-')).toList();

    cardStates = List.generate(
      filteredProducts.length,
          (index) => _CardState(
        name: filteredProducts[index].name,
      ),
    );
  }

  List<Widget> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.cheek);

    if (products.isEmpty) {
      return const <Widget>[];
    }

    List<Product> filteredProducts =
    products.where((product) => product.id.startsWith('7-')).toList();

    return filteredProducts.map((product) {
      int index = int.parse(product.id.split('-')[1]);
      return ChangeNotifierProvider.value(
        value: cardStates[index],
        child: Consumer<_CardState>(
          builder: (context, cardState, _) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.black, width: 1.2),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
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
                              'assets/images/sym/cheek/${product.id}.png',
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
                              cardState.toggleChecked();
                            });
                          },
                          icon: cardState.isChecked
                              ? Icon(Icons.check_box)
                              : Icon(Icons.check_box_outline_blank),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }).toList();
  }

  void _goToBagPage() {
    List<Product> selectedProducts = cardStates.asMap().entries
        .where((entry) => entry.value.isChecked)
        .map((entry) {
      List<Product> products = ProductsRepository.loadProducts(Category.cheek);
      return products[entry.key];
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Bag(selectedProducts: selectedProducts,),
      ),
    );
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
        onTap: _goToBagPage,
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
