import 'package:flutter/material.dart';
import 'package:hellonong/widget/test.dart';

import 'bag.dart';
import 'mypage.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}


class _PharmacyState extends State<Pharmacy> {
  List <bool>_isSelected = [false, true, false];
  Test test = Test(1);

  String dropdownvalue = 'ASC';
  var items = ['ASC', 'DASC',];

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
      //Pharmacy
      body: Column(
        children: [
          ToggleButtons(
            children: <Widget>[
              Icon(Icons.bluetooth),
              Icon(Icons.wifi),
              Icon(Icons.flash_on),
            ],
            isSelected: _isSelected,
            onPressed: (int index) {
              setState(() {
                _isSelected[index] = !_isSelected[index];
              });
            },
          ),
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),


      bottomNavigationBar: test.bottmNavi(context),
    );
  }
}

