import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/item/item_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../_core/constants/http.dart';

class ItemList extends StatelessWidget {
  final CodiDetailModel? model;
  final int codiId;

  const ItemList({
    required this.model,
    required this.codiId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, CodiIndex) {
          return SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model!.itemPhotos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemPage(
                                    itemId: model!.itemPhotos[index].itemsId,
                                    codiId: codiId,
                                  )),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Container(
                            width: double.infinity, // 셀의 전체 너비 사용
                            height: double.infinity, // 셀의 전체 높이 사용
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$baseURL${model!.itemPhotos[index].photoPath}',
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
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

//
