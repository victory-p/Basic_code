import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';

class Symptom_picture extends StatefulWidget {
  const Symptom_picture({Key? key});

  @override
  State<Symptom_picture> createState() => _Symptom_pictureState();
}

class _CardState {
  bool isChecked;

  _CardState({required this.isChecked});
}

class _Symptom_pictureState extends State<Symptom_picture> {
  List<_CardState> cardStates = List.generate(10, (_) => _CardState(isChecked: false));

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) {
        return Card(
          color: Colors.white, // 네모의 배경색을 흰색으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.black, width: 1.0), // 테두리의 색상과 두께 설정
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          cardStates[index].isChecked = !cardStates[index].isChecked;
                        });
                      },
                      icon: cardStates[index].isChecked
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 18.0 / 12.0,
                child: Image.asset('assets/diamond.png'),
              ),
            ],
          ),
        );
      },
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(0, 1, context),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 7.0 / 8.0, // 이 부분을 조정하여 오버플로우 제거
        children: _buildGridCards(10),
      ),
    );
  }
}
