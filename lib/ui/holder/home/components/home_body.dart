import 'dart:async';

import 'package:final_project_team02/models/slide_ad.dart';
import 'package:flutter/cupertino.dart';

import 'home_ad_scroll.dart';
import 'home_creator_scroll.dart';
import 'home_main_title.dart';
import 'home_main_title_another.dart';
import 'home_more_style.dart';
import 'home_ootd_scroll.dart';
import 'home_sliver_app_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final PageController _pageController = PageController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    timer();
    return CustomScrollView(
      slivers: [
        HomeSliverAppBar(),
        //광고 스크롤
        AdScroll(pageController: _pageController),
        //메인 타이틀
        MainTitle(),
        CreatorScroll(),
        MainTitleAnother(),
        OotdScroll(),
        MoreStyle(),
      ],
    );
  }

  Timer timer() {
    return _timer = Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage == slideAdList.length) {
          nextPage = 0; // ✅마지막 이미지가 끝나면 첫 이미지로
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
