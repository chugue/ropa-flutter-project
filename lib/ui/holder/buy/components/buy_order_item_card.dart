import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../_core/constants/http.dart';

class BuyOrderItemCard extends StatelessWidget {
  String itemTitle;
  String subTitle;
  String options;
  String qty;
  String price;
  String photoPath;

  BuyOrderItemCard({
    required this.itemTitle,
    required this.subTitle,
    required this.options,
    required this.qty,
    required this.price,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 1, color: Colors.black12),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity, // 셀의 전체 너비 사용
                          height: double.infinity, // 셀의 전체 높이 사용
                          child: CachedNetworkImage(
                            imageUrl: '${baseURL}${photoPath}',
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
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${itemTitle}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${subTitle}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(height: 5),
                            ),
                            Text(
                              "${options}",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "${qty}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${price}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     print("Delete Button Pressed");
                      //   },
                      //   icon: Icon(CupertinoIcons.xmark_circle),
                      //   padding: EdgeInsets.zero,
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
