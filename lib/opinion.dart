import 'package:flutter/material.dart';
import 'package:hellonong/listtwo.dart';
import 'package:hellonong/result.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/bottomNavi.dart';

class ListItemData {
  bool isSwitched;
  Color color;
  String opinion;
  String body;

  ListItemData({
    required this.isSwitched,
    required this.color,
    required this.opinion,
    required this.body,
  });
}

class Opinion extends StatefulWidget {
  final List<String> checkedItems;
  final Function(String) onAddItem;
  final Function(String) onRemoveItem;

  Opinion({
    required this.checkedItems,
    required this.onAddItem,
    required this.onRemoveItem,
    Key? key,
  }) : super(key: key);

  @override
  State<Opinion> createState() => _OpinionState();
}

class _OpinionState extends State<Opinion> {
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

  List<ListItemData> opinionData = [];

  @override
  void initState() {
    super.initState();

    for (String checkedItem in widget.checkedItems) {
      opinionData.add(ListItemData(
        isSwitched: true,
        color: Colors.black,
        body: "머리", // Replace with actual value
        opinion: checkedItem,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFC1C1C1),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '<의사소견서>',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.checkedItems.length,
                        itemBuilder: (context, index) {
                          String checkedItem = widget.checkedItems[index];
                          bool isSwitched = opinionData.any((item) => item.opinion == checkedItem);
                          return CheckboxListTile(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  opinionData.add(ListItemData(
                                    isSwitched: true,
                                    color: Colors.black,
                                    body: "머리", // Replace with actual value
                                    opinion: checkedItem,
                                  ));
                                  widget.onAddItem(checkedItem); // 항목 추가
                                } else {
                                  opinionData.removeWhere((item) => item.opinion == checkedItem);
                                  widget.onRemoveItem(checkedItem); // 항목 제거
                                }
                              });
                            },
                            title: Text(checkedItem),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.08,
                child: ElevatedButton(
                  onPressed: _navigateToListWidget,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        '기타 소견, 안내사항 작성',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: GestureDetector(
        onTap: _showDialog,
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
    );
  }

  void _navigateToListWidget() async {
    final selectedItems = await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ListTwo(checkedItems: opinionData.map((item) => item.opinion).toList()),
      ),
    );

    if (selectedItems != null) {
      setState(() {
        for (String item in selectedItems) {
          opinionData.add(ListItemData(
            isSwitched: true,
            color: Colors.black,
            body: "머리", // Replace with actual value
            opinion: item,
          ));
          widget.onAddItem(item); // 항목 추가
        }
      });
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            '선택하신 질병은 환자에게 수어 영상으로 제공됩니다. 정확한 진단이 완료되었다면 확인 버튼을 눌러주세요.',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '닫기',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Result()), // Result 클래스로 이동
                );
              },
              child: Text(
                '확인',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
