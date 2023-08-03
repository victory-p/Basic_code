import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';

final List<String> items = [
  '증상에 대한 질병 명을\n카테고리 분류에 따라 선택해주세요',
  '자주 사용된 진단\n감기 / 타박상 등',
  '건강검진 진료 관련 용어\n타박상/ 고지혈증/ 고혈당/ 빈혈 등',
  '이비인후과 /청각장애 관련 용어\n만성중이염/ 중이염/ 미로염 /이경화증 등',
  '생식 및 임신/출산 관련 용어\n폐경/ 진통/ 입덧/ 산후우울증 등',
  '호흡기계 진료 관련 용어\n감기/ 가래/ 코피/ 호흡곤란/ 편도염 등',
  '순환기/심혈관계 진료 관련 용어\n하지정맥류/ 부정맥/ 심근경색증 등',
  '소화기계 진료 관련 용어\n간비대/ 간염/ 결석/ 급성 담낭염 등',
  '근골격계 진료 관련 용어\n감각둔화/ 감각소실/ 강직성/ 골다공증 등',
  '치과 진료 관련 용어\n충치/ 부정교합/ 매복 등',
  '소아과 진료 관련 용어\n사경/ 수두증/ 야노증/ 볼거리 등',
  '신경계/신경과 진료 관련 용어\n간질/ 뇌경색/ 뇌동맥류/ 뇌졸중 등',
  '감염 및 면역 진료 관련 용어\n면역반응/ 면역결핍/ 염증/ 발열 등',
  '피부과 진료 관련 용어\n감지러움증/ 건조증/ 다한증/ 땀띠 등',
  '안과 진료 관련 용어\n각막염/ 녹내장/ 안구건조증/ 백내장 등',
  '내분비내과 진료 관련 용어\n갑상선종/ 골수염/ 당뇨병/임파선염 등',
  '신장/비뇨기계 진료 관련 용어\n다뇨증/ 도뇨/ 방광염/ 복막투석 등',
];


class ListWidget extends StatelessWidget {
  final int index; // 인덱스 값을 받아오는 변수

  const ListWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(0, 0, context), // Make sure 'CustomAppBar' is implemented correctly
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Data ${index + 1} - ${items[index]}',
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

