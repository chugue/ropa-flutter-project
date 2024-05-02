import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_tab_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_tab_view_closet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatorBottom extends StatelessWidget {
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
                    CreatorTabBar(),

                    Expanded(
                      child: TabBarView(
                        children: [
                          //탭바 그리드
                          Align(child: Text("크리에이터가 되어 자신의 멋진 코디를 뽐내 보세요.!!")),
                          //탭바 옷장
                          CreatorTabViewCloset()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 66,
            left: 10,
            right: 10,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "지원하기",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ))
      ],
    );
  }

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}
