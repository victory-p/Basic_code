import 'package:flutter/material.dart';
import 'opinion.dart';
import 'widget/appbar.dart';

class Question extends StatefulWidget {
  final List<String> questionItems;

  const Question({Key? key, required this.questionItems}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  late List<bool> isSelected;

  final List<String> questionItems = [
    '환자 증상에 대한 추가 질문\n진단을 내리기 전 환자에게 추가로 질문하고 싶은 것을 체크해주세요. 체크한 것은 수어 영상으로 환자에게 제공됩니다.',
    '증상정도를 손가락으로 1~10 중에 표현해주세요.',
    '어느 쪽이 아프세요?',
    '언제부터 아프셨어요?',
    '아픈 부위를 구체적으로 보여주세요',
    '입을 벌려주세요',
    '검사가 오래 걸릴 수 있습니다.',
  ];

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(
      questionItems.length - 1,
          (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = questionItems[0];
    final checkboxText = questionItems.sublist(1);

    return Scaffold(
      appBar: CustomAppBar(0, 0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black38,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(thickness: 1, color: Colors.black38),
                Expanded(
                  child: ListView.builder(
                    itemCount: checkboxText.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              Theme.of(context).colorScheme.primary,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                checkboxText[index],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: isSelected[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  isSelected[index] = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          List<String> checkedItems = [];
          for (int i = 0; i < checkboxText.length; i++) {
            if (isSelected[i]) {
              checkedItems.add(checkboxText[i]);
            }
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Opinion(checkedItems: checkedItems),
            ),
          );
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
}
