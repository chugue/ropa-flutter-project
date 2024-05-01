import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'cart_page_body_item_card_detail_quantity.dart';

class CartPageBodyItemCardDetail extends StatelessWidget {
  const CartPageBodyItemCardDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int _quantity = 1;
    return Row(
      children: [
        Container(
          width: 80,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://picsum.photos/200/100',
              // :TODO 04 사진수정
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('상의 이름', style: textTheme().displayMedium),
            Text('배송: [무료] / 기본배송', style: textTheme().displayMedium),
            SizedBox(width: 16),
            Text('상품구매금액: 352,000원 ', style: textTheme().displayMedium),
            CartPageBodyItemCardDetailQuantity(quantity: _quantity)
          ],
        ),
      ],
    );
  }
}
