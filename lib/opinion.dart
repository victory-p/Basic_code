import 'package:flutter/material.dart';
import 'package:hellonong/result.dart';
import 'package:hellonong/symptoms_category.dart';
import 'package:hellonong/widget/appbar.dart';
import 'bag.dart';
import 'home.dart';
import 'mypage.dart';
import 'widget/bottomNavi.dart';

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

class ChecklistItem {
  bool isChecked;
  String title;

  ChecklistItem({required this.isChecked, required this.title});
}

class Opinion extends StatefulWidget {
  final List<String> checkedItems;

  Opinion({required this.checkedItems, Key? key}) : super(key: key);

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
    // Set default checked status based on the checked items passed from the previous screen
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
      appBar: CustomAppBar(0, 1, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.7,
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
                Positioned(
                  bottom: screenHeight * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SymptomsCategory()),
                      );
                    },
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
                Positioned(
                  top: screenHeight * 0.05,
                  child: Text(
                    '<의사소견서>',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  left: 20,
                  right: 20,
                  bottom: 20,
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
                            } else {
                              opinionData.removeWhere((item) => item.opinion == checkedItem);
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
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          _showDialog();
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
    );
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
                  color: Colors.black38,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Result()), // 필요한 경우 주석 해제
                );
              },
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
