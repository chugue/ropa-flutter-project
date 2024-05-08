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
                      // TODO : 이미지 업로드 기능 구현
                      print("🧡💛💚💙💜🤎🖤🤍플러스 눌러짐🧡💛💚💙💜🤎🖤🤍");
                      setState(() {});
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
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                        "https://picsum.photos/id/${index + 1}/1000/1000",
                      )),
                    ),
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
