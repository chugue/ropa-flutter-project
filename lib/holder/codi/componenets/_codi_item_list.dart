import 'package:flutter/cupertino.dart';

import '../../../models/codi.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Image.asset(
                          codiList[CodiIndex].itemImg[CodiItemIndex],
                          // 'assets/example_image_$index.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
