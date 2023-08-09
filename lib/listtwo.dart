import 'package:flutter/material.dart';
import 'package:hellonong/opinion.dart';
import 'package:hellonong/widget/appbar.dart';

class ListTwo extends StatefulWidget {
  final List<String> checkedItems;

  const ListTwo({Key? key, required this.checkedItems}) : super(key: key);

  @override
  _ListTwoState createState() => _ListTwoState();
}

class _ListTwoState extends State<ListTwo> {
  late List<bool> isSelected;
  List<String> checkedItemsTwo = [];

  final List<String> additionalDiagnoses = [
    '환자에게 내리고 싶은 추가 진단\n질병 이외에 환자에게 해야하는 추가 진단을 선택해주세요. 복수 선택이 가능하며, 장바구니에서 선택하신 것을 확인할 수 있습니다.',
    '약복용 완료 후, 증상이 남아있으면 재진단을 받으러 오세요.',
    '밀가루 음식은 드시면 안됩니다.',
    '약의 부작용이 있으시면 병원을 재방문해주세요.',
    '과도한 움직임은 자제해주세요.',
    '수어통역사를 동반하여 병원을 재방문해주세요.',
    '큰 병원을 정밀검사를 받으세요.',
    '추가로 검사를 진행해야합니다.',
    '추가 사항 없음.',
  ];

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(
      additionalDiagnoses.length,
          (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    additionalDiagnoses[0],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Divider(thickness: 1, color: Colors.black38),
                Expanded(
                  child: ListView.builder(
                    itemCount: additionalDiagnoses.length - 1,
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
                                additionalDiagnoses[index + 1],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: isSelected[index + 1],
                              onChanged: (bool? value) {
                                setState(() {
                                  isSelected[index + 1] = value!;
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
        onTap: _navigateToOpinion,
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

  void _navigateToOpinion() {
    // Add newly checked items from ListTwo
    for (int i = 1; i < additionalDiagnoses.length; i++) {
      if (isSelected[i]) {
        checkedItemsTwo.add(additionalDiagnoses[i]);
      }
    }

    // Combine the checked items from both ListWidget and ListTwo
    List<String> combinedCheckedItems = List.from(widget.checkedItems)
      ..addAll(checkedItemsTwo);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Opinion(
          checkedItems: combinedCheckedItems,
          onAddItem: _addItem,
          onRemoveItem: _removeItem,
        ),
      ),
    );
  }

  // Implement the add item function for Opinion widget
  void _addItem(String item) {
    setState(() {
      checkedItemsTwo.add(item);
    });
  }

  // Implement the remove item function for Opinion widget
  void _removeItem(String item) {
    setState(() {
      checkedItemsTwo.remove(item);
    });
  }
}
