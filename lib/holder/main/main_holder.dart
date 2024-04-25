import 'dart:async';

import 'package:final_project_team02/models/slide_ad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_ad_scroll.dart';
import '_creator_scroll.dart';
import '_main_title.dart';
import '_main_title_another.dart';
import '_more_style.dart';
import '_ootd_scroll.dart';

class MainHolder extends StatefulWidget {
  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  final PageController _pageController = PageController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
      if (nextPage == slideAdList.length) {
        nextPage = 0; // 마지막 이미지가 끝나면 첫 이미지로
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          AdScroll(pageController: _pageController),
          MainTitle(),
          CreatorScroll(),
          MainTitleAnother(),
          OotdScroll(),
          MoreStyle(),
          IndexedStack(
            index: _Index,
            children: [
              MainHolder(),
            ],
          )
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      // body: SettingsPage(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      //글자를 없애고 가운데로 배치한다.
      showUnselectedLabels: false,
      //선택이 될때 글자가 보인다.
      backgroundColor: Colors.blueGrey,
      //선택된 아이콘에 색상 보여주기
      selectedItemColor: Colors.redAccent,
      //클릭시 아이콘 색상
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      // currentIndex: _selectedIndex,
      onTap: (index) {},
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(CupertinoIcons.home),
        ),
        BottomNavigationBarItem(label: '', icon: Icon(CupertinoIcons.bag)),
        BottomNavigationBarItem(
            label: '', icon: Icon(CupertinoIcons.person_fill)),
      ],
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      title: Row(
        children: [
          SizedBox(
            child: Image.asset(
              "assets/images/ropa_logo.png",
              width: 120,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.ellipsis,
            size: 30,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
