import 'package:final_project_team02/holder/item/components/item_page_body_item_info.dart';
import 'package:flutter/material.dart';

import 'item_page_body_buy_button.dart';
import 'item_page_body_detail_button.dart';
import 'item_page_body_service_info.dart';

class ItemPageBody extends StatelessWidget {
  const ItemPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemInfo(), // 사진, 브랜드, 가격, 이름
          ItemDetailButton(), // 상세보기
          ItemServiceInfo(), // 고객센터
          ItemBuyButton(), // 구매하기
        ],
      ),
    );
  }
}
