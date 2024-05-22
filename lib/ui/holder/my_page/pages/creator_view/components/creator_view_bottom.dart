import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/components/creator_view_tab_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'creator_view_tab_view_closet.dart';
import 'creator_view_tab_view_grid.dart';

class CreatorViewBottom extends StatelessWidget {
  final CreatorVModel model;

  CreatorViewBottom({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                //탭바
                CreatorViewTabBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Creator 코디 목록
                      CreatorViewTabViewGird(model: model),
                      // Creator 아이템 목록
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

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}
