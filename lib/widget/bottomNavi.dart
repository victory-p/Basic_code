import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationWidget({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 50,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital_outlined, size: 45,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.capsules, size: 45,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 45,),
          label: '',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      onTap: widget.onItemTapped, // 탭하면 _onItemTapped 메서드 호출
      type: BottomNavigationBarType.fixed, // 아이콘의 위치 고정
    );
  }
}
