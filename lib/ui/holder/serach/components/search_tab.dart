import 'package:final_project_team02/ui/holder/serach/components/search_tab_bar.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_Item.dart';
import 'package:final_project_team02/ui/holder/serach/components/search_tab_view_codi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchTab extends StatelessWidget {
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
                //탭바
                SearchTabBar(),

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
