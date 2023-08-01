import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';

class Symptom_picture extends StatefulWidget {
  const Symptom_picture({Key? key});

  @override
  State<Symptom_picture> createState() => _Symptom_pictureState();
}

class _Symptom_pictureState extends State<Symptom_picture> {
  bool isChecked = false; // 상태에 따라 체크 여부를 저장할 변수

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 1, context),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[
          Card(
            color: Colors.white, // 네모의 배경색을 흰색으로 설정
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.black, width: 1.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '열 증상',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isChecked = !isChecked; // 체크 상태 변경
                          });
                        },
                        icon: isChecked
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                      ),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
              ],
            ),
          ),
          // Add more Card widgets here for additional grid items
        ],
      ),
    );
  }
}
