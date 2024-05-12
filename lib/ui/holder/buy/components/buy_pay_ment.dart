import 'package:expandable/expandable.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_pay_ment_default_options.dart';
import 'package:flutter/material.dart';

import 'buy_option_buy_options.dart';
import 'custom_main_title.dart';

class BuyPayMent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExpandableController expController =
        new ExpandableController(initialExpanded: true);
    return ExpandablePanel(
      controller: expController,
      header: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomMainTitle(text: "결제수단"),
      ),
      theme: ExpandableThemeData(
        iconColor: Colors.black,
        iconPadding: EdgeInsets.symmetric(horizontal: 20),
        iconSize: 30,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
      ),
      collapsed: SizedBox(),
      expanded: Column(
        children: [
          Container(height: 1, color: Colors.black12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Container(
                    child: Text(
                      "결제수단 선택",
                      style: TextStyle(color: Colors.black),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                BuyPayMentOptions(),
                Container(
                  color: Color.fromRGBO(250, 250, 252, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "- 카카오톡 앱을 설치한 후, 최초 1회 카드정보를 등록하셔야 사용 가능합니다.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "- 인터넷 익스플로러는 8 이상에서만 결제 가능합니다.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "- 카카오머니로 결제시, 현금영수증 발급은 (주)카카오페이에서 발급가능합니다.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                BuyPayMentDefaultOptions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
