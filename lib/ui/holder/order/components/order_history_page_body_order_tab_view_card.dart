import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:flutter/material.dart';

class OrderHistoryPageBodyOrderTabViewCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final String itemOptions;
  final String deliveryCharge;
  final String deliveryStatus;

  OrderHistoryPageBodyOrderTabViewCard({
    required this.itemName,
    required this.itemPrice,
    required this.itemOptions,
    required this.deliveryCharge,
    required this.deliveryStatus,
  });

  @override
  Widget build(BuildContext context) {
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
                      child: Text("${deliveryStatus}",
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
                          Text('${itemName}', style: textTheme().displayMedium),
                          Text('배송: ${deliveryCharge}',
                              style: textTheme().displayMedium),
                          SizedBox(width: 16),
                          Text('상품구매금액: ${itemPrice}원 ',
                              style: textTheme().displayMedium),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Text("[옵션 : ${itemOptions} ]"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
