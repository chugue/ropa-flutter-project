import 'package:final_project_team02/ui/holder/my_page/pages/user/components/user_my_page_body_bottom_tab_bar_closet.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/user_my_page_body_bottom_tab_bar_grid.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/user_my_page_body_bottom_tab_var.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'apply/user_my_page_apply_modal_body.dart';

class UserMyPageBodyBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    //탭바
                    UserTabBar(),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // 탭바 그리드
                          UserTabGird(),
                          // 탭바 옷장
                          UserTabCloset(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        UserMyPageApplyModalBody()
      ],
    );
  }

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}
