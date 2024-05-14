import 'dart:convert';

import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPageBodyItemCardDetail extends StatelessWidget {
  final CartModel model;
  final int index;

  CartPageBodyItemCardDetail({
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String itemPirce = formatCurrency(model.cartList[index].totalItemPrice);
    int _quantity = 1;
    return Row(
      children: [
        Container(
          width: 80,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity, // 셀의 전체 너비 사용
              height: double.infinity, // 셀의 전체 높이 사용
              child: Image.memory(
                const Base64Decoder()
                    .convert(model.cartList[index].itemPhotoBase64),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  model.cartList[index].itemName,
                  style: textTheme().displayMedium,
                  maxLines: 2,
                ),
              ),
              Text('배송: [무료] / 기본배송', style: textTheme().displayMedium),
              SizedBox(width: 16),
              Text('상품금액: ${itemPirce}', style: textTheme().displayMedium),
              // CartPageBodyItemCardDetailQuantity(quantity: _quantity)
            ],
          ),
        ),
      ],
    );
  }
}
