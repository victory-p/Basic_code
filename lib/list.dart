import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';
import 'opinion.dart';

final List<String> items = [
  '자주 사용되는 진단\n감기\n두드러기\n비염\n염증\n알레르기\n아토피\n외상',
  '건강검진 진료 관련 용어\n고지혈증(이상지질혈증)\n고혈당\n낭종성\n빈혈\n저혈당\n타박상\n후유증',
  '이비인후과/청각장애 관련 용어\n미로염\n외이도염\n이경화증\n중이염\n만성중이염',
  '생식 및 임신/출산 관련 용어\n골반염\n산후우울증\n월경과다\n월경통\n임신중독증\n입덧\n자궁근종\n전립선염\n진통\n질염\n폐경\n풍진',
  '호흡기계 진료 관련 용어\n가래 또는 객담\n감기\n과호흡\n기흉\n만성 폐쇄성 페질환\n부비동염(축농증)\n비염\n비중격 편위\n쌕쌕거림, 천명\n침습\n코피(비출혈)\n편도염\n폐결핵\n폐렴\n호흡곤란',
  '순환기/심혈관계 진료 관련 용어\n경색증\n고콜레스테롤혈증\n기립성 저혈압\n동맥경화\n부정맥\n빈맥\n서맥\n심계항진\n심근경색증\n심막염\n심부정맥 혈전증\n심장판막질환\n출혈성 질환\n탈수열\n하지정맥류\n허혈\n현훈\n혈소판감소증\n협심증',
  '소화기계 진료 관련 용어\n간비대\n간염\n결석\n과민대장증후군\n구강건조증\n구내염\n구토\n급성 담낭염\n담관염\n담낭염\n담석증\n변비\n복수\n삼킴장애\n설사\n소화불량\n식도 정맥류\n십이지장 궤양\n역류\n역류성 식도염\n영양결핍\n위궤양\n위식도역류\n위염\n장염\n장폐색\n지방간\n췌장염\n치열\n황달',
  '근골격계 진료 관련 용어\n감각둔화\n감각소실\n강직성(경직성)\n골다공증\n골절\n관절 탈구\n근경련\n근염\n근육 파열\n근육병\n류마티스 관절\n무지외반증\n봉와직염\n부종\n불완전 탈구\n십자인대 파열\n열상\n염좌(삐임)\n요추염\n요통\n척추관협착증\n척추압박골절\n통풍\n퇴행성 관절염\n편평족\n화농',
  '치과 진료 관련 용어\n매복치\n부정교합\n치아 과잉발육\n치아우식증(충치)',
  '소아과 진료 관련 용어볼거리\n사경\n수두증\n야뇨증',
  '신경계 진료 | 신경과 관련 용어\n간질\n근강직\n근긴장\n긴장성 두통\n뇌경색\n뇌동맥류\n뇌염\n뇌졸중\n대상포진\n수막염\n신경증\n알츠하이머병\n어지럼증\n외상성 뇌손상\n우뇌 손상\n척수염\n치매\n파킨슨병\n편두통',
  '감염 및 면역 관련 용어\n면역결핍\n면역반응\n발열\n약물과민반응\n염증\n헤르페스',
  '피부과 진료 관련 용어\n각화증\n간지러움증\n건조증\n기미\n다한증\n동상\n두드러기\n땀띠\n모낭증\n무좀\n반점\n발진\n사마귀\n색소침착\n수포\n습진\n아토피\n알레르기\n여드름\n지루성 피부염\n진균\n찰과상\n찰상\n탈모증\n티눈\n팽진,두드러기\n화상\n흉터',
  '안과 진료 관련 용어\n각막염\n녹내장\n망막박리\n백내장\n비문증\n사시\n안구건조증\n야맹증\n황반변성',
  '내분비내과 진료 관련 용어\n갑상선종/ 기능저하증\n골수염\n당뇨병\n임파선염\n호르몬',
  '신장/비뇨기계 관련 용어\n요로감염\n요실금\n포경수술\n다뇨증\n신장암\n요로 결석\n요도염\n단백뇨\n신우신염\n요독증\n신증후군\n신장염\n복막 투석\n만성 신부전\n방광염\n혈뇨\n빈뇨\n도뇨',
];

class ListWidget extends StatefulWidget {
  final int index;

  const ListWidget({Key? key, required this.index}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(
      items[widget.index].split('\n').length - 1,
          (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemsSplit = items[widget.index].split('\n');
    final title = itemsSplit[0];
    final checkboxText = itemsSplit.sublist(1);

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
                    style: TextStyle(fontSize: 16),
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

