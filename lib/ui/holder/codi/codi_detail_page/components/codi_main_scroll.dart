import 'package:final_project_team02/models/codi.dart';
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
                itemCount: codiList[codiIndex].mainImg.length,
                itemBuilder: (context, imgIndex) {
                  // 각 코디의 이미지 리스트에 대한 페이지 뷰 빌드
                  return Image.asset(
                    codiList[codiIndex].mainImg[imgIndex],
                    fit: BoxFit.cover,
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
