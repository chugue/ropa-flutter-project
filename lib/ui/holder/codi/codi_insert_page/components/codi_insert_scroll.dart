import 'package:flutter/material.dart';

class CodiInsertScroll extends StatefulWidget {
  const CodiInsertScroll({super.key});

  @override
  State<CodiInsertScroll> createState() => _CodiInsertScrollState();
}

class _CodiInsertScrollState extends State<CodiInsertScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int CodiIndex) {
          return Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2 /* ✅TODO : 추 후 + 1 */,
              itemBuilder: (context, int index) {
                if (index == 2 - 1) /* ✅-1 지울 것*/ {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 120,
                        height: 120,
                        child: Image.network(
                            "https://picsum.photos/id/${index + 1}/1000/1000",
                            fit: BoxFit.cover),
                      ),
                      if (index == 0) /* ✅mainImg의 index, 추후 로직 변경*/

                        Positioned(
                          top: 5,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              "대표",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
