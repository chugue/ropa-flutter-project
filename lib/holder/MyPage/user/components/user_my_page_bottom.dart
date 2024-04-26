import 'package:final_project_team02/holder/MyPage/user/components/user_apply_button.dart';
import 'package:final_project_team02/holder/MyPage/user/components/user_tab_bar_closet.dart';
import 'package:final_project_team02/holder/MyPage/user/components/user_tab_bar_grid.dart';
import 'package:final_project_team02/holder/MyPage/user/components/user_tab_var.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserMyPageBottom extends StatelessWidget {
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
                          //탭바 그리드
                          UserTabGird(),
                          //탭바 옷장
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
        UserApplyButton()
      ],
    );
  }

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}





