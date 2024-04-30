import 'dart:async';

import 'package:final_project_team02/models/slide_ad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componenets/_ad_scroll.dart';
import 'componenets/_creator_scroll.dart';
import 'componenets/_main_title.dart';
import 'componenets/_main_title_another.dart';
import 'componenets/_more_style.dart';
import 'componenets/_ootd_scroll.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MainHolderState();
}

class _MainHolderState extends State<HomePage> {
  final PageController _pageController = PageController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    //메인 광고 사진 오토
    timer();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),

          //광고 스크롤
          AdScroll(pageController: _pageController),

          //메인 타이틀
          MainTitle(),
          CreatorScroll(),
          MainTitleAnother(),
          OotdScroll(),
          MoreStyle(),
        ],
      ), // body: SettingsPage(),
    );
  }

  Timer timer() {
    return _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
      if (nextPage == slideAdList.length) {
        nextPage = 0; // ✅마지막 이미지가 끝나면 첫 이미지로
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
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
