import 'package:final_project_team02/ui/holder/home/home_page.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_my_page.dart';
import 'package:final_project_team02/ui/holder/serach/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHolder extends StatefulWidget {
  @override
  State<MainHolder> createState() => _MainHorderState();
}

class _MainHorderState extends State<MainHolder> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          SearchPage(),
          UserMyPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      //글자를 없애고 가운데로 배치한다.

      showUnselectedLabels: false,
      //선택이 될때 글자가 보인다.

      backgroundColor: Colors.white,
      //선택된 아이콘에 색상 보여주기

      selectedItemColor: Colors.black,
      //클릭시 아이콘 색상

      unselectedItemColor: Colors.grey.shade400,
      //아이콘 색상

      currentIndex: _selectedIndex,
      onTap: (i) => {
        setState(() {
          _selectedIndex = i;
        })
      },

      items: [
        BottomNavigationBarItem(label: 'ㅁ', icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: 'ㅁ', icon: Icon(CupertinoIcons.search)),
        BottomNavigationBarItem(
            label: 'ㅁ', icon: Icon(CupertinoIcons.person_fill)),
        // BottomNavigationBarItem(
        //     label: '', icon: Icon(CupertinoIcons.person_fill)),
      ],
    );
  }
}
