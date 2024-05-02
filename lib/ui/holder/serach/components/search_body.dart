import 'package:final_project_team02/ui/holder/serach/components/search_tab_bar.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_Item.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_codi.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // 검색 상자의 여백 추가
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 40.0,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '검색하세요', // 검색 상자에 표시될 힌트 텍스트
                          border: InputBorder.none, // 테두리 없애기
                          icon: Icon(Icons.search), // 검색 아이콘
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: MyPersistentHeaderDelegate(
                    minHeight: 50,
                    maxHeight: 50,
                    child:
                        Container(color: Colors.white, child: SearchTabBar())),
                pinned: true,
              ),
            ];
          },
          body: Column(
            children: [
              SizedBox(height: 60),
              //탭바
              Expanded(
                child: TabBarView(
                  children: [
                    //탭바 그리드
                    SearchTabViewCodi(),
                    //탭바 옷장
                    SearchTabViewItem(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MyPersistentHeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
