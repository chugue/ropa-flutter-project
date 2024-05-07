import 'dart:async';

import 'package:final_project_team02/data/global_data/slide_ad.dart';
import 'package:final_project_team02/ui/holder/home/components/home_ad_scroll.dart';
import 'package:final_project_team02/ui/holder/home/components/home_creator_scroll.dart';
import 'package:final_project_team02/ui/holder/home/components/home_item_scroll.dart';
import 'package:final_project_team02/ui/holder/home/components/home_main_title.dart';
import 'package:final_project_team02/ui/holder/home/components/home_main_title_another.dart';
import 'package:final_project_team02/ui/holder/home/components/home_more_style.dart';
import 'package:final_project_team02/ui/holder/home/components/more_style_codi.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final PageController _pageController = PageController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    timer();
    return CustomScrollView(
      slivers: [
        //광고 스크롤
        AdScroll(pageController: _pageController),
        //메인 타이틀
        MainTitle(),
        CreatorScroll(),
        MainTitleAnother(),
        ItemScroll(),
        MoreStyle(),
        MoreStyleCodi(),
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
