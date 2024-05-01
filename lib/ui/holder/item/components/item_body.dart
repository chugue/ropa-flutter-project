import 'package:flutter/material.dart';

import 'item_buy_button.dart';
import 'item_detail_view_button.dart';
import 'item_info.dart';
import 'item_service_info.dart';

class ItemBody extends StatelessWidget {
  const ItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemInfo(), // 사진, 브랜드, 가격, 이름
          ItemDetailViewButton(), // 상세 보기
          ItemServiceInfo(), // 고객 센터 정보
          ItemBuyButton(), // 구매하기
        ],
      ),
    );
  }
}
