import 'package:final_project_team02/models/codi.dart';
import 'package:final_project_team02/ui/holder/item/item_page.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, CodiIndex) {
            return SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: codiList[CodiIndex].itemImg.length,
                itemBuilder: (context, CodiItemIndex) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("사진 클릭 됨");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ItemPage()),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Image.asset(
                              codiList[CodiIndex].itemImg[CodiItemIndex],
                              // 'assets/example_image_$index.jpg',
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
      ),
    );
  }
}
