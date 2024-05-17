import 'dart:async';

import 'package:final_project_team02/data/global_data/slide_ad.dart';
import 'package:final_project_team02/ui/holder/home/components/home_ad_scroll.dart';
import 'package:final_project_team02/ui/holder/home/components/home_creator_scroll.dart';
import 'package:final_project_team02/ui/holder/home/components/home_item_scroll.dart';
import 'package:final_project_team02/ui/holder/home/components/home_main_title.dart';
import 'package:final_project_team02/ui/holder/home/components/home_main_title_another.dart';
import 'package:final_project_team02/ui/holder/home/components/home_more_style.dart';
import 'package:final_project_team02/ui/holder/home/components/more_style_codi.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends ConsumerWidget {
  final PageController _pageController = PageController();

  Timer? _timer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeModel? model = ref.watch(homeProvider);

    if (model == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      timer();
      return CustomScrollView(
        slivers: [
          // ✅ 광고 스크롤
          AdScroll(pageController: _pageController),

          // ✅ 인기 크리에이터 스크롤
          MainTitle(),
          SliverToBoxAdapter(
            child: CreatorScroll(model: model),
          ),

          //  ✅ 인기 아이템 스크롤
          MainTitleAnother(),
          SliverToBoxAdapter(
            child: ItemScroll(model: model),
          ),

          //  ✅ 더 많은 스타일
          MoreStyle(),
          MoreStyleCodi(model: model),
        ],
      );
    }
  }

  // ✅ 광고 스크롤 타이머, 컨트롤러.
  Timer timer() {
    return _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_pageController.positions.isNotEmpty) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage == slideAdList.length) {
          nextPage = 0; // ✅마지막 이미지가 끝나면 첫 이미지로
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
