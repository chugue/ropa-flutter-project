import 'package:final_project_team02/holder/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../_core/constants/theme.dart';
import 'cart_page_body_item_card_delete.dart';
import 'cart_page_body_item_card_detail.dart';
import 'cart_page_body_item_card_order.dart';


class CartPageBodyItemCard extends StatelessWidget {
  const CartPageBodyItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartPageBodyItemCardDetail(),
            Divider(),
            SizedBox(width: 20),
            Text("[옵션 : free ]"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //아이템 카드 삭제
                CartPageBodyItemCardDelete(),

                //아이템 카드 주문하기
                CartPageBodyItemCardOrder()
              ],
            ),

          ],
        ),
      ),
    );
  }
}



