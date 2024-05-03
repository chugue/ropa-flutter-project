import 'dart:async';

import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:final_project_team02/models/slide_ad.dart';
import 'package:flutter/material.dart';

import '../../codi/codi_detail_page/codi_page.dart';
import 'home_ad_scroll.dart';
import 'home_creator_scroll.dart';
import 'home_item_scroll.dart';
import 'home_main_title.dart';
import 'home_main_title_another.dart';
import 'home_more_style.dart';
import 'home_sliver_app_bar.dart';

class HomeBody extends StatefulWidget {
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
        ItemScroll(),
        MoreStyle(),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // ✅한 행에 두 개의 항목
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 12.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodiPage(ootd: ootdList[index])));
                    },
                    child: Image.network(
                      // "https://picsum.photos/400/400",
                      "https://picsum.photos/id/${index + 1}/600/600",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.auto_awesome_motion,
                      color: Colors.white,
                    ),
                  )
                ],
              );
            },
            childCount: 8,
          ),
        ),
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
