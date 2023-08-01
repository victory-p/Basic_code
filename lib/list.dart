import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListState();
}

class _ListState extends State<ListWidget> {
  List<String> dataList = []; // 데이터를 저장할 리스트 변수

  @override
  void initState() {
    super.initState();
    _loadData(); // initState에서 데이터를 불러오도록 호출
  }

  // 비동기 방식으로 데이터 크기를 가져오는 메서드
  Future<int> _getDataSize() async {
    // 여기에서 실제 데이터 크기를 가져오는 로직을 구현합니다.
    // 예시로 비동기 딜레이를 사용하여 1에 해당하는 데이터 크기로 10을 반환하는 코드를 작성합니다.
    await Future.delayed(Duration(seconds: 1));
    return 10;
  }

  // 데이터 크기에 맞게 데이터를 불러오는 메서드
  void _loadData() async {
    int dataSize = await _getDataSize();

    for (int i = 1; i <= dataSize; i++) {
      dataList.add("Data $i");
    }

    // 데이터가 변경되었음을 알리고 화면을 갱신합니다.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // dataList에 저장된 데이터를 활용하여 리스트를 만드는 위젯을 반환합니다.
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(dataList[index]),
        );
      },
    );
  }
}
