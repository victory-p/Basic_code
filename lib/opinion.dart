import 'package:flutter/material.dart';
import 'package:hellonong/widget/test.dart';
import 'bag.dart';
import 'mypage.dart';

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

class Opinion extends StatefulWidget {
  const Opinion({super.key});

  @override
  State<Opinion> createState() => _OpinionState();
}

class _OpinionState extends State<Opinion> {
  List<ListItemData> opinionData = [
    ListItemData(isSwitched: false, color: Colors.black, body: "머리", symptom: "두통, 발열"),
    ListItemData(isSwitched: false, color: Colors.black, body: "코", symptom: "콧물"),
  ];

  Test test = Test(0);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bag()),
              );
            },
            icon: Icon(
              Icons.list_alt_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage()),
              );
            },
            icon: Icon(
              Icons.person_outline,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
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
                        MaterialPageRoute(builder: (context) => MyPage()),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: test.bottmNavi(context),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
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
