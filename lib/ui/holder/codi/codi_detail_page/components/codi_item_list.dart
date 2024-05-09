import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/item/item_page.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final CodiDetailModel? model;

  const ItemList({
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
              itemCount: model!.itemPhotos.length,
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
                                  itemId: model!.itemPhotos[index].itemsId)),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Image.network(
                              "https://picsum.photos/id/${model!.itemPhotos[index].itemsId + 1}/1000/1000",
                              fit: BoxFit.cover),
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
