import 'package:flutter/cupertino.dart';

class CodiMainScroll extends StatelessWidget {
  const CodiMainScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, codiIndex) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  // 각 코디의 이미지 리스트에 대한 페이지 뷰 빌드
                  return Image.network(
                      "https://picsum.photos/id/${index + 1}/1000/1000",
                      fit: BoxFit.cover);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
