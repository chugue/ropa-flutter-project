import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:final_project_team02/ui/holder/item/item_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../_core/constants/http.dart';

class ItemScroll extends StatelessWidget {
  final HomeModel model;

  ItemScroll({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, CodiIndex) {
          return SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model!.itemsPhotos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemPage(
                              itemId: model.itemsPhotos[index].itemsId,
                              codiId: model.codiPhotos[index].codiId,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '$baseURL${model!.itemsPhotos[index].photoPath}',
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
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
                              Column(
                                children: [
                                  Text(
                                    model!
                                        .itemsPhotos[index].adminInfo.brandName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    model!.itemsPhotos[index].name,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
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
