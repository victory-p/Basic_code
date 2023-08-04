import 'package:flutter/material.dart';
import 'package:hellonong/widget/appbar.dart';
import 'package:hellonong/widget/test.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'bag.dart';
import 'mypage.dart';
import 'widget/bottomNavi.dart';

class Usage extends StatefulWidget {
  const Usage({Key? key}) : super(key: key);

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  int _selectedIndex = 0;

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

  Test test = Test(1);

  // 유튜브 동영상의 비디오 ID
  String videoId = 'F8cNkdi2J8M';

  void _onCheckIconTapped() {
    Navigator.pop(context); // 홈으로 돌아가는 동작
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(1, 0, context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFC1C1C1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                          Theme.of(context).colorScheme.primary,
                          child: Text(
                            '1', // 인덱스
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '제목',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '부제목',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // 유튜브 플레이어
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoId,
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  SizedBox(height: 20), // 원하는 만큼 간격 조절
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: _onCheckIconTapped, // 체크 아이콘 클릭 시 동작
                      child: Container(
                        width: screenWidth * 0.78,
                        height: screenHeight * 0.065,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 37,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
