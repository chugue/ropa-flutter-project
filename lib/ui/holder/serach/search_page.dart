import 'package:final_project_team02/ui/holder/serach/components/search_tab_bar.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_Item.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_codi.dart';
import 'package:flutter/material.dart';

import 'components/search_body.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 10,
                collapsedHeight: 100,
                toolbarHeight: 90,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // 검색 상자의 여백 추가
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Container(
                            height: 40.0,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '검색하세요', // 검색 상자에 표시될 힌트 텍스트
                                border: InputBorder.none, // 테두리 없애기
                                icon: Icon(Icons.search), // 검색 아이콘
                              ),
                            ),
                          ),
                          SearchTabBar(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              //탭바
              Expanded(
                child: TabBarView(
                  children: [
                    //탭바 코디
                    SearchTabViewCodi(),

                    //탭바 아이템
                    SearchTabViewItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
