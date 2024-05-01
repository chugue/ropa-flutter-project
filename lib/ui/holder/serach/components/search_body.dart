import 'package:flutter/material.dart';

import '../../my_page/pages/user/components/user_my_page_body_bottom_tab_bar_closet.dart';
import '../../my_page/pages/user/components/user_my_page_body_bottom_tab_var.dart';

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
                snap: false,
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
              SliverToBoxAdapter(
                child: UserTabBar(),
              ),
            ];
          },
          body: Column(
            children: [
              //탭바
              Expanded(
                child: TabBarView(
                  children: [
                    //탭바 그리드
                    Align(child: Text("크리에이터가 되어 자신의 멋진 코디를 뽐내 보세요.!!")),
                    //탭바 옷장
                    UserTabCloset(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
