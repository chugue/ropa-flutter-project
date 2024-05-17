import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_codi_insert_button.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_tab_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/components/creator_view_tab_view_closet.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/components/creator_view_tab_view_grid.dart';
import 'package:flutter/material.dart';

class CreatorBottom extends StatelessWidget {
  final CreatorModel model;

  CreatorBottom({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                // ✅ 선택 탭바
                CreatorTabBar(),

                Expanded(
                  child: TabBarView(
                    children: [
                      // ✅ 코디 목록
                      Stack(
                        children: [
                          // 📢  if문. codiList가 Empty면 '?'
                          model.codiList.isEmpty
                              // ✅ MSG : 코디를 등록 하세요.
                              ? _codiInsertMsg()

                              // ✅ 코디 목록 보기
                              : CreatorViewTabViewGird(model: model),

                          // ✅ 코디 등록 버튼
                          CodiInsertButton(),
                        ],
                      ),

                      // ✅ Creator 아이템 목록
                      CreatorViewTabViewCloset(model: model),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Align _codiInsertMsg() {
    return Align(
      child: Container(
        width: 320,
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: '이제부터 '),
              TextSpan(text: '크리에이터 ', style: TextStyle(color: Colors.red)),
              TextSpan(text: '활등을 통해 '),
              TextSpan(text: '리워드', style: TextStyle(color: Colors.blue)),
              TextSpan(text: '를 받을 수 있습니다. '),
              TextSpan(text: '지금 바로 자신의 코디를 등록하세요.'),
            ],
          ),
        ),
      ),
    );
  }
}
