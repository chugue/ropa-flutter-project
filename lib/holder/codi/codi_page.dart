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
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "2024.04.28",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "내게는 소중했던 잠못 이루던 날들이 너에겐 지금과 다르지 않았다."
                "사랑은 비극이어라 그대는 내가 아니다 추억은 다르게 적힌다",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 16.0),
              child: Text(
                "아이템 목록",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), // 폰트 사이즈 30 설정
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, CodiIndex) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: PageView.builder(
                        itemCount: codiList[CodiIndex].itemImg.length,
                        itemBuilder: (context, CodiItemIndex) {
                          return SizedBox(
                            child: Image.asset(
                              width: MediaQuery.of(context).size.width * 0.30,
                              codiList[CodiIndex].itemImg[CodiItemIndex],
                              // 'assets/example_image_$index.jpg',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 16.0),
              child: Text(
                "코디 목록",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), // 폰트 사이즈 30 설정
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: ootdList.length * 120 /* 수정 해야함. */,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // ✅한 행에 두 개의 항목
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: ootdList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      ootdList[index].Img,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
