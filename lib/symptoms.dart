import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/test.dart';
import 'mypage.dart';
import 'bag.dart';
import 'opinion.dart';
import 'widget/bottomNavi.dart';

class ListItemData {
  bool isSwitched;
  Color color;
  String symptom;
  String body;

  ListItemData({
    required this.isSwitched,
    required this.color,
    required this.symptom,
    required this.body,
  });
}

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
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

  List<ListItemData> symptomsData = [
    ListItemData(isSwitched: false, color: Colors.black, body: "머리", symptom: "두통, 발열"),
    ListItemData(isSwitched: false, color: Colors.black, body: "코", symptom: "콧물"),
  ];

  Test test = Test(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(0,0, context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: symptomsData.length,
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemBuilder: (context, index) {
            ListItemData listItemData = symptomsData[index];

            return Container(
              width: 335,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFFC1C1C1),
                  width: 1,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${index + 1}번증상\n\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '아픈 부위 : ${listItemData.body}\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '증상 : ${listItemData.symptom}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // 아이콘을 가로 방향으로 중앙 정렬
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // 이동할 페이지 지정 (MyPage 대신 다른 페이지로 수정 가능)
                    MaterialPageRoute(builder: (context) => Opinion()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 5),
                    Text('환자 증상에 대한 추가 질문', style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                // 이동할 페이지 지정 (MyPage 대신 다른 페이지로 수정 가능)
                MaterialPageRoute(builder: (context) => Opinion()),
              );
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Image.asset('assets/images/Stethoscope.png'), // 이미지 리소스 추가
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
