import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../item/item_page.dart';

class ItemScroll extends StatelessWidget {
  final HomeModel? model;

  ItemScroll({
    required this.model,
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
              itemCount: model!.itemsPhotos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("사진 클릭 됨");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemPage(
                                    itemId: model!.itemsPhotos[index].itemsId,
                                  )),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Image.network(
                            "https://picsum.photos/id/${model!.itemsPhotos[index].itemsId}/600/600",
                            fit: BoxFit.cover,
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
