import 'package:flutter/material.dart';
import 'package:hellonong/pharmacy_next.dart';
import 'package:hellonong/widget/test.dart';

import 'bag.dart';
import 'mypage.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  List<bool> _isSelected1 = [false, false];
  List<bool> _isSelected2 = [false, false];
  List<bool> _isSelected3 = [false, false];
  Test test = Test(1);

  String dropdownvalue1 = '몇분';
  var items1 = ['몇분','5분', '10분', '15분', '30분'];
  String dropdownvalue2 = '몇분';
  var items2 = ['몇분','5분', '10분', '15분', '30분'];
  String dropdownvalue3 = '몇분';
  var items3 = ['몇분','5분', '10분', '15분', '30분'];

  String dropdownvalue4 = '몇일';
  var items4 = ['몇일','3일', '4일', '7일', '14일'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Bag()));
            },
            icon: Icon(
              Icons.list_alt_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
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
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              "아침",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50),
              Expanded(
                child: ToggleButtons(
                  children: <Widget>[
                    Text(
                      '식전',
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                    Text(
                      '후',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ],
                  isSelected: _isSelected1,
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  onPressed: (int index) {
                    setState(() {
                      _isSelected1[index] = !_isSelected1[index];
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: 50,
                  child: DropdownButton(
                    value: dropdownvalue1,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items1.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 22),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue1 = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              "점심",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50),
              Expanded(
                child: ToggleButtons(
                  children: <Widget>[
                    Text(
                      '식전',
                      style: TextStyle(fontSize: 23),
                    ),
                    Text(
                      '후',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                  isSelected: _isSelected2,
                  selectedColor: Colors.black,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  onPressed: (int index) {
                    setState(() {
                      _isSelected2[index] = !_isSelected2[index];
                    });
                  },
                ),
              ),
              SizedBox(width: 10), // 원하는 간격 조정
              Expanded(
                child: Container(
                  child: DropdownButton(
                    value: dropdownvalue2,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items2.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 22),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue2 = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              "저녁",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50),
              Expanded(
                child: ToggleButtons(
                  children: <Widget>[
                    Text(
                      '식전',
                      style: TextStyle(fontSize: 23),
                    ),
                    Text(
                      '후',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                  isSelected: _isSelected3,
                  selectedColor: Colors.black,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  onPressed: (int index) {
                    setState(() {
                      _isSelected3[index] = !_isSelected3[index];
                    });
                  },
                ),
              ),
              SizedBox(width: 10), // 원하는 간격 조정
              Expanded(
                child: Container(
                  child: DropdownButton(
                    value: dropdownvalue3,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items3.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 22),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue3 = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              "복용일수",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Container(
            width: 150,
            child: DropdownButton(
              value: dropdownvalue4,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items4.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 22),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue4 = newValue!;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: test.bottmNavi(context),

      floatingActionButton: GestureDetector(
        onTap: () {
          // Replace 'NextPage()' with the actual class for the next page you want to navigate to.
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Pharmacy_next()));
        },
        child: Container( // Wrap the Image.asset with a Container.
          child: Image.asset(
            'assets/images/checkbox.png',
            fit: BoxFit.cover, // Adjust the fit property according to your needs.
          ),
        ),
      ),
    );
  }
}
