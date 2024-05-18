import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/order_history_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../_core/constants/http.dart';

class OrderHistoryPageBodyOrderTabViewCard extends StatelessWidget {
  final OrderHistoryModel model;

  const OrderHistoryPageBodyOrderTabViewCard({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.itemHistoryList.length, // 리스트에 표시할 항목의 개수
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
                      child: Text("${model.itemHistoryList[index].itemName}",
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
                          child: CachedNetworkImage(
                            imageUrl:
                                '$baseURL${model.itemHistoryList[index].photoPath}',
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("결제"),
                            Text(
                              "${model.itemHistoryList[index].deliveryStatus}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${model.itemHistoryList[index].itemName}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
                                Text(
                                  "${formatCurrency(model.itemHistoryList[index].itemPrice)}",
                                  style: textTheme().displaySmall,
                                  softWrap: true,
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                          ],
                        ),
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
                          Text(
                              "${model.itemHistoryList[index].itemCategoryMain}"),
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
                          Text("${model.itemHistoryList[index].itemCount}개"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                          '${formatCurrency(model.itemHistoryList[index].itemTotalPrice)}',
                          style: textTheme().bodyLarge),
                      SizedBox(width: 10),
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
