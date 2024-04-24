import 'dart:async';

import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/creator.dart';
import '../models/slide_ad.dart';
import 'main_components/auto_ad_slider.dart';
import 'main_components/creator_circle.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({super.key});

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 3초마다 페이지를 넘기는 타이머 설정
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          _AdScroll(pageController: _pageController),
          _MainTitle(),
          _CreatorScroll(),
          _MainTitleAnother(),
          _OotdScroll(),
          _moreStyle(),
        ],
      ),
      // body: SettingsPage(),
    );
  }
}

class _OotdScroll extends StatelessWidget {
  const _OotdScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ootdList.length,
          itemBuilder: (context, index) {
            return PopularOotd(
              ootd: ootdList[index],
            );
          },
        ),
      ),
    );
  }
}

class _MainTitleAnother extends StatelessWidget {
  const _MainTitleAnother({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              "인기 제품",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "(기준 판매량)",
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}

class _CreatorScroll extends StatelessWidget {
  const _CreatorScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: creatorList.length,
          itemBuilder: (context, index) {
            /* 콜백 함수, 각 index에 자식 위젯 빌드 */ {
              return CreatorCircle(
                creator: creatorList[index],
              );
            }
          },
        ),
      ),
    );
  }
}

class _MainTitle extends StatelessWidget {
  const _MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "인기 크리에이터",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.0),
        ),
      ),
    );
  }
}

class _AdScroll extends StatelessWidget {
  const _AdScroll({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal /* ✅가로로 스크롤 */,
          itemCount: slideAdList.length /* ✅샘플 더미 만큼 */,
          itemBuilder: (context, index) {
            /* 콜백 함수, 각 index에 자식 위젯 빌드 */ {
              return AutoAdSlider(
                slideAd: slideAdList[index],
              );
            }
          },
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

class PopularOotd extends StatelessWidget {
  const PopularOotd({
    super.key,
    required this.ootd,
  });

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              ootd.Img,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      // TODO : 좋아요 기능넣기
                    },
                    icon: ootd.meLike == true /* 아이콘 인데, true면 ? false면 : */
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_outline)),
                Text("${ootd.like}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _moreStyle extends StatelessWidget {
  const _moreStyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.add_circle,
                size: 24,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                "더 많은 스타일!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
