import 'package:flutter/material.dart';
import 'package:hellonong/symptoms_category.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/test.dart';
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
  const Opinion({super.key});

  @override
  State<Opinion> createState() => _OpinionState();
}

class _OpinionState extends State<Opinion> {
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

  List<ListItemData> opinionData = [
    ListItemData(isSwitched: true, color: Colors.black, body: "머리", opinion: "감기"),
    ListItemData(isSwitched: true, color: Colors.black, body: "코", opinion: "비염"),
  ];

  Test test = Test(0);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 1 ,context),
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
                  top: screenHeight * 0.05, // 원하는 위치로 조정
                  child: Text(
                    '<의사소견서>',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.15, // 원하는 위치로 조정
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: ListView.builder(
                    itemCount: opinionData.length,
                    itemBuilder: (context, index) {
                      ListItemData listItem = opinionData[index];
                      return CheckboxListTile(
                        value: listItem.isSwitched,
                        onChanged: (value) {
                          setState(() {
                            opinionData[index].isSwitched = value ?? false;
                          });
                        },
                        title: Text(listItem.opinion),
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
          width: 100, // 너비를 늘려서 가로로 긴 버튼으로 만듭니다.
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle, // 사각형 모양의 버튼 사용
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
              fontSize: 17, // 다이얼로그 내용 텍스트 사이즈 변경
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
                  color: Colors.black38, // 닫기 버튼 텍스트 색상 변경
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.blueAccent, // 확인 버튼 텍스트 색상 변경
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
