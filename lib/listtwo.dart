import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/bottomNavi.dart';
import 'list.dart';

class ListTwo extends StatefulWidget {
  const ListTwo({Key? key}) : super(key: key);

  @override
  State<ListTwo> createState() => _ListTwoState();
}

class _ListTwoState extends State<ListTwo> {
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

  final List<String> items = [
    '환자에게 내리고 싶은 추가 진단\n질병 이외에 환자에게 해야하는 추가 진단을 선택해주세요. 복수 선택이 가능하며, 체크표를 누르면 선택하신 것을 확인할 수 있습니다.',
    '약복용 완료 후, 증상이 남아있으면 재진단을 받으러 오세요',
    // ... (이하 생략)
  ];

  List<bool> checkedItems = List.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.9,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black38,
                width: 1,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        items[0],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.black38),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length - 1,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index + 1].split('\n')[0],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              items[index + 1].split('\n')[1],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: checkedItems[index],
                        onChanged: (value) {
                          setState(() {
                            checkedItems[index] = value!;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
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

  void _onListItemClicked(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListWidget(index: index),
      ),
    );
  }
}
