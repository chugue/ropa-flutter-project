import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/components/bottom_button.dart';
import 'package:final_project_team02/ui/components/positioned_button.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_page.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_page.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_tab_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_tab_view_closet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreatorBottom extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch()

    return Column(
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
                      Stack(
                        children: [
                          Align(
                            child: Container(
                              width: 320,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(text: '이제부터 '),
                                    TextSpan(
                                        text: '크리에이터 ',
                                        style: TextStyle(color: Colors.red)),
                                    TextSpan(text: '활등을 통해 '),
                                    TextSpan(
                                        text: '리워드',
                                        style: TextStyle(color: Colors.blue)),
                                    TextSpan(text: '를 받을 수 있습니다. '),
                                    TextSpan(text: '지금 바로 자신의 코디를 등록하세요.'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 0,
                            child: SizedBox(
                              width: 350,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CodiInsertPage(),));
                                },
                                child: Text(
                                  '코디 등록하기',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
    );
  }

  //가격 1,000원 쉼표, 넣기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}
