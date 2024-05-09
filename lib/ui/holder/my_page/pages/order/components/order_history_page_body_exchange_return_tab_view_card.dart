import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../_core/constants/theme.dart';

class OrderHistoryPageBodyExchangeReturnTabViewCard extends StatelessWidget {
  final String itemName;
  final String itemBrand;
  final int itemPrice;
  final String itemOptions;
  final String deliveryCharge;
  final String deliveryStatus;
  final String applyDate;
  final String whatTodo;
  final String itemQty;

  OrderHistoryPageBodyExchangeReturnTabViewCard({
    required this.itemName,
    required this.itemPrice,
    required this.itemOptions,
    required this.deliveryCharge,
    required this.deliveryStatus,
    required this.applyDate,
    required this.whatTodo,
    required this.itemBrand,
    required this.itemQty,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat('#,###');
    String itemPriceFormatter = formatter.format(itemPrice);

    return Expanded(
      child: ListView.builder(
        itemCount: 1, // 리스트에 표시할 항목의 개수
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("${whatTodo}${deliveryStatus}",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 20),
                  Row(
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
                          Text(
                            "${applyDate} ${whatTodo}신청",
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            "${deliveryCharge} 배송",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            '${itemBrand}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                          Text('${itemName}', style: textTheme().displayMedium),
                          SizedBox(width: 16),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Text(" 옵션 ",
                                style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(width: 10),
                          Text("${itemOptions}"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Text(" 수량 ",
                                style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(width: 10),
                          Text("${itemQty}개"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(itemPriceFormatter + "원",
                          style: textTheme().bodyLarge),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
