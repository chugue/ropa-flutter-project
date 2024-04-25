import 'package:final_project_team02/models/codi.dart';
import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/material.dart';

import '../../components/main_app_bar.dart';

class CodiPage extends StatelessWidget {
  const CodiPage({super.key, required this.ootd});

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 500,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, CodiIndex) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      itemCount: codiList[CodiIndex].mainImg.length,
                      itemBuilder: (context, imgIndex) {
                        // 각 코디의 이미지 리스트에 대한 페이지 뷰 빌드
                        return Image.asset(
                          codiList[CodiIndex].mainImg[imgIndex],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        // TODO : 좋아요 기능넣기
                      },
                      icon: ootd.meLike == true /* 아이콘 인데, true면 ? false면 : */
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_outline)),
                  Text("${ootd.like}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
