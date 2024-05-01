import 'package:final_project_team02/models/slide_ad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_auto_ad_slider.dart';

class AdScroll extends StatelessWidget {
  const AdScroll({
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
